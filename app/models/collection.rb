class Collection < ActiveRecord::Base
  has_many :records, :as => :recordable
  has_many :granules

  # ====Params   
  # None
  # ====Returns
  # Record Array
  # ==== Method
  # returns all records found in the DB of type collection

  def self.all_records
    Record.all.where(recordable_type: "Collection")
  end

  # ====Params   
  # string concept_id,     
  # string revision_id
  # ====Returns
  # Boolean
  # ==== Method
  # Checks the DB and returns boolean if a record with matching concept_id and revision_id is found

  def self.record_exists?(concept_id, revision_id) 
    return !(Collection.find_record(concept_id, revision_id).nil?)
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
      record = collection.records.where(revision_id: revision_id).first
    end

    return record
  end

  # ====Params   
  # User     
  # ====Returns
  # Review Array
  # ==== Method
  # Queries the DB and returns all reviews belonging to param User which   
  # are marked in progress.  In progress determined by "review_state" field being == to 0    

  def self.user_open_collection_reviews(user)
    user.collection_reviews.where(review_state: 0)
  end

end