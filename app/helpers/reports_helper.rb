module ReportsHelper

  def list_past_months
    @review_month_counts = []
    #this should be optimized to bucket all the reviews in one run through
    10.downto(0).to_a.each do |month_count|
      total_count = (Review.all.select { |review| 
                                            if review.review_completion_date
                                              (DateTime.now.month - review.review_completion_date.month) >= month_count
                                            else
                                              false 
                                            end
                                        }).count
      @review_month_counts.push(total_count)
    end
    @review_month_counts
  end

end