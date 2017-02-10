class Cmr
  include ApplicationHelper
  include CmrHelper

  TIMEOUT_MARGIN = 10


  def self.cmr_request(url)
    HTTParty.get(url, timeout: TIMEOUT_MARGIN)
  end

  #cmr api auto returns only the most recent revision of a collection
  # &all_revisions=true&pretty=true" params can be used to find specific revision
  #we should only need to ingest the most recent versions.
  def self.get_collection(concept_id)
    collection_xml = Cmr.cmr_request("https://cmr.earthdata.nasa.gov/search/collections.echo10?concept_id=#{concept_id}").parsed_response
    collection_results = Hash.from_xml(collection_xml)["results"]
    results_hash = flatten_collection(collection_results["result"]["Collection"])
    Cmr.add_required_collection_fields(results_hash)
  end

  def self.add_required_collection_fields(collection_hash)
    required_fields = ["ShortName", "VersionId", "InsertTime", "LastUpdate", "LongName", "DatasetId", "Description", "Orderable", "Visible",
                        "ProcessingLevelId", "ArchiveCenter", "DataFormat", "Temporal/Range/DateTime/BeginningDateTime", "Contacts/Contact/Role"]
    keys = collection_hash.keys
    required_fields.each do |field|
      unless Cmr.keyset_has_field?(keys, field)
        collection_hash[field] = ""
      end
    end

    collection_hash
  end

  def self.keyset_has_field?(keys, field)
    byebug
    split_field = field.split("/")
    regex = split_field.reduce("") {|sum, split_name| sum + split_name + ".*"}
    return (keys.select {|key| key =~ /#{regex}/}).any?
  end

  def self.collection_granule_count(collection_concept_id)
    granule_list = Cmr.granule_list_from_collection(collection_concept_id)
    return granule_list["hits"].to_i
  end

  def self.granule_list_from_collection(concept_id, page_num = 1)
    granule_xml = Cmr.cmr_request("https://cmr.earthdata.nasa.gov/search/granules.echo10?concept_id=#{concept_id}&page_size=10&page_num=#{page_num}").parsed_response
    Hash.from_xml(granule_xml)["results"]
  end

  def self.random_granules_from_collection(collection_concept_id, granule_count = 1)
    granule_data_list = []

    unless granule_count == 0
      granule_results = Cmr.granule_list_from_collection(collection_concept_id)
      total_granules = granule_results["hits"].to_i
        
      #checking if we asked for more granules than exist  
      if total_granules < granule_count
        return -1
      end

      granule_data_list = []

      #getting a random list of granules addresses within available amount
      granules_picked = (0...total_granules).to_a.shuffle.take(granule_count)
      granules_picked.each do |granule_address|
        #have to add 1 because cmr pages are 1 indexed
        page_num = (granule_address / 10) + 1
        page_item = granule_address % 10

        #cmr does not return a list if only one result
        if total_granules > 1
          granule_data = Cmr.granule_list_from_collection(collection_concept_id, page_num)["result"][page_item]
        else
          granule_data = Cmr.granule_list_from_collection(collection_concept_id, page_num)["result"]
        end
        granule_data_list.push(granule_data)
      end
    end

    return granule_data_list
  end

  def self.collection_search(free_text, provider = ANY_KEYWORD, curr_page)
    unless curr_page
      curr_page = "1"
    end

    page_size = 10
    search_iterator = []

    if free_text
      query_text = "https://cmr.earthdata.nasa.gov/search/collections.echo10?keyword=?*#{free_text}?*&page_size=#{page_size}&page_num=#{curr_page}"

      #cmr does not accept first character wildcards for some reason, so remove char and retry query
      query_text_first_char = "https://cmr.earthdata.nasa.gov/search/collections.echo10?keyword=#{free_text}?*&page_size=#{page_size}&page_num=#{curr_page}"
      unless provider == ANY_KEYWORD
        query_text = query_text + "&provider=#{provider}"
        query_text_first_char = query_text_first_char + "&provider=#{provider}"
      end

      raw_xml = Cmr.cmr_request(query_text).parsed_response
      search_results = Hash.from_xml(raw_xml)["results"]

      #rerun query with first wildcard removed
      if search_results["hits"].to_i == 0
        raw_xml = Cmr.cmr_request(query_text_first_char).parsed_response
        search_results = Hash.from_xml(raw_xml)["results"]
      end

      collection_count = search_results["hits"].to_i

      if search_results["hits"].to_i > 1
        search_iterator = search_results["result"]
      elsif search_results["hits"].to_i == 1
        search_iterator = [search_results["result"]]
      else
        search_iterator = []
      end
    end

    return search_iterator, collection_count
  end

end