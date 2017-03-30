class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @collection_ingest_count = Collection.all.length
    @cmr_total_collection_count = Cmr.total_collection_count

    @records = Record.where(recordable_type: "Collection")
  end

  def provider
    if params["daac"].nil?
      redirect_to reports_home_path
    end
    @daac = params["daac"]
    @total_collection_count = Cmr.total_collection_count(@daac)
    @total_ingested = Collection.by_daac(@daac).count

    @percent_ingested = (@total_ingested.to_f * 100 / @total_collection_count).round(2)

    @review_counts = Collection.completed_review_counts(@daac)
    @total_completed = Collection.total_completed(@daac)

    @field_colors = Collection.color_counts(@daac)
    @total_checked = @field_colors[0] + @field_colors[1] + @field_colors[2] + @field_colors[3]

    @red_flags = Collection.red_flags(@daac)

    @updated_count = Collection.updated_count(@daac)
    @updated_done_count = Collection.updated_done_count(@daac)

    @quality_done_records = Collection.quality_done_records(@daac)
  end

end