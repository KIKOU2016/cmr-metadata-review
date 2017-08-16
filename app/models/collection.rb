class Collection < ActiveRecord::Base
  has_many :records, :as => :recordable
  has_many :granules

  SUPPORTED_FORMATS = ["dif10", "echo10"]
  INCLUDE_GRANULE_FORMATS = ["echo10"]

  extend RecordRevision

  
  def get_records
    self.records.where(hidden: false)
  end

  # ====Params   
  # string concept_id,     
  # string revision_id
  # ====Returns
  # Boolean
  # ==== Method
  # Checks the DB and returns boolean if a record with matching concept_id and revision_id is found

  def self.record_exists?(concept_id, revision_id) 
    record = Collection.find_record(concept_id, revision_id)
    return (!record.nil?) && (!record.hidden)
  end

  # ====Params   
  # string concept_id,     
  # string revision_id
  # ====Returns
  # Record || nil
  # ==== Method
  # Queries the DB and returns a record matching params    
  # if no record is found, returns nil.

  def self.find_record(concept_id, revision_id) 
    record = nil

    collection = Collection.find_by concept_id: concept_id
    unless collection.nil?
      record = collection.records.where(revision_id: revision_id, hidden: false).first
    end

    return record
  end



  def self.assemble_new_record(concept_id, revision_id, current_user)
    native_format = Cmr.get_raw_collection_format(concept_id)

    if native_format == "dif10"
      collection_data = Cmr.get_collection(concept_id, native_format)
      short_name = collection_data["Entry_ID/Short_Name"]
    elsif native_format == "echo10"
      collection_data = Cmr.get_collection(concept_id, native_format)
      short_name = collection_data["ShortName"]
    else 
      #Guard against records that come in with unsupported types
      return
    end

    ingest_time = DateTime.now
    #finding parent collection
    collection_object = Collection.find_or_create_by(concept_id: concept_id)
    collection_object.short_name = short_name
    collection_object.save!
    #creating collection record related objects
    new_collection_record = Record.new(recordable: collection_object, revision_id: revision_id, format: native_format, closed: false)

    record_data_list = []

    collection_data.each_with_index do |(key, value), i|
      record_data = RecordData.new(record: new_collection_record)
      record_data.last_updated = DateTime.now
      record_data.column_name = key
      record_data.value = value
      record_data.order_count = i
      record_data.daac = concept_id.partition('-').last
      record_data_list.push(record_data)
    end

    ingest_record = Ingest.new(record: new_collection_record, user: current_user, date_ingested: ingest_time)

    return collection_object, new_collection_record, record_data_list, ingest_record
  end


  # ====Params   
  # String, DAAC Short Name  
  # ====Returns
  # Collection list
  # ==== Method
  # returns all collections ingested that belong to the daac parameter

  def self.by_daac(daac_short_name)
    Collection.all.select { |collection| (collection.concept_id.include? daac_short_name) && (!collection.get_records.empty?)}
  end

  def update?
    self.cmr_update
  end

  def self.update?(concept_id)
    collection = Collection.find_by concept_id: concept_id
    if collection.nil?
      return false
    else
      collection.cmr_update
    end
  end


  #method added for the manual addition of granules into the database for collections.
  def add_granule(current_user)
    if current_user.nil?
      current_user = User.find_by(email: 'abaker@element84.com')
    end

    granules_components = []
    granules_count = 1
    native_format = self.records[0].format

      #checking that no granule exists for previously imported/deleted records.
      if self.granules.count == 0
        #only selecting granules for certain formats per business rules
        if Collection::INCLUDE_GRANULE_FORMATS.include? native_format 
            #creating all the Granule related objects
            granules_components = Granule.assemble_granule_components(self.concept_id, granules_count, self, current_user)
        end
      end

      save_success = false
      #saving all the related collection and granule data in a combined transaction
        granules_components.flatten.each { |savable_object| 
                                              if savable_object.is_a?(Array)
                                                savable_object.each do |savable_item|
                                                  savable_item.save!
                                                end
                                              else
                                                savable_object.save! 
                                              end
                                          }

        #In production there is an egress issue with certain link types given in metadata
        #AWS hangs requests that break ingress/egress rules.  Added this timeout to catch those
        Timeout::timeout(20) {
          #getting list of records for script
          granule_records = granules_components.flatten.select { |savable_object| savable_object.is_a?(Record) }
          granule_records.each do |record|
            record.create_script
          end
        }
        save_success = true


    if !save_success
      return -1
    end

    return 0
  end

  def remove_all_granule_data
    granules = self.granules
    granules.each do |granule|
      granule_records = granule.records
      granule_records.each do |record|
        record_datas = record.record_datas
        record_datas.each do |data|
          data.destroy
        end
        record.ingest.destroy
        record.destroy
      end
      granule.destroy
    end
  end


end