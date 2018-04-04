module ApplicationHelper

  ANY_KEYWORD = 'DAAC: ANY'
  SELECT_DAAC = 'Select DAAC'
  #providers are specified to identify only the records within EOSDIS
  PROVIDERS = ['NSIDCV0',
              'ORNL_DAAC',
              'LARC_ASDC',
              'LARC',
              'LAADS',
              'GES_DISC',
              'GHRC',
              'SEDAC',
              'ASF',
              'LPDAAC_ECS',
              'LANCEMODIS',
              'NSIDC_ECS',
              'OB_DAAC',
              'CDDIS',
              'LANCEAMSR2',
              'PODAAC']


  def provider_select_list
    daac_list(ANY_KEYWORD)
  end

  def select_daac_list
    daac_list(SELECT_DAAC)
  end

  def string_html_format(string)
    sanitize(string, tags: %w(br a)).gsub(/(?:\n\r?|\r\n?)/, '<br>').html_safe
  end

  def records_sorted_by_short_name(records)
    records.sort_by do |record|
      record.recordable.short_name
    end
  end

  private

  def daac_list(select_text)
    select_list = [select_text]
    PROVIDERS.each do |provider|
      select_list.push([provider, provider])
    end
    select_list
  end
end
