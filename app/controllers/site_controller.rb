class SiteController < ApplicationController

  before_filter :authenticate_user!, :except => [:elb_status]
  before_filter :ensure_curation, :except => [:general_home, :elb_status]

  def home
    records = filtered_by_daac? ? Record.daac(params[:daac]) : Record.all

    # Ingested records by user
    @user_collection_ingests = []
    # Unfinished review records
    @user_open_collection_reviews = []
    
    # Unreviewed by user, record not closed
    @unreviewed_records = records.open.sort_by { |record| record.recordable.short_name }
    
    # Reviewed by user, record not closed
    @in_arc_review_records = records.in_arc_review.sort_by { |record| record.recordable.short_name }

    # Record closed
    @closed_records = records.closed.sort_by { |record| record.recordable.short_name }

    @waiting_daac_release_records = records.ready_for_daac_review.sort_by { |record| record.recordable.short_name }

    @requires_curator_feedback_records = records.joins(:record_datas, :reviews).where(record_data: { feedback: true}, reviews: { user_id: current_user.id })
    
    @in_daac_review_records = records.in_daac_review
    if current_user.role.eql?('daac_curator')
      @in_daac_review_records = @in_daac_review_records.daac(current_user.daac)
    end
    
    @in_daac_review_records.sort_by { |record| record.recordable.short_name }
    
    @search_results = []
  end

  def general_home
    if current_user
      sign_out current_user
    end
    redirect_to home_path
  end

  def elb_status
    render :json => {"elb_status" => "ok" }
  end

  private

  def filtered_by_daac?
    params[:daac] && params[:daac] != ANY_KEYWORD
  end
end
