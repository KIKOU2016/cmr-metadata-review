class ReviewsController < ApplicationController

  def show
    @concept_id = params["concept_id"]
    @revision_id = params["revision_id"]

    if !(@concept_id || @revision_id)
      flash[:error] = "Missing the concept_id or revision_id to Locate review"
      redirect_to curation_home_path
    end

    @collection_record = Collection.find_record(@concept_id, @revision_id)
    @record_comments = @collection_record.comments
    @user_comment = @record_comments.select { |comment| comment.user_id == current_user.id }

    @other_users_comments = @record_comments.select { |comment| (comment.user_id != current_user.id && comment.user_id != -1) }
    @other_users_comments_count = @other_users_comments.length

    @script_comment = @record_comments.select { |comment| comment.user_id == -1 }.first

    if @script_comment
      @script_comment = JSON.parse(@script_comment.rawJSON)
    end

    #a boolean test to determine if any review exists (should replace with review??)
    if @user_comment.empty?

      @collection_record.add_review(current_user.id)
      @collection_record.add_flag(current_user.id)
      @collection_record.add_comment(current_user.id)
      #grabbing the newly made comment
      @user_comment = Comment.where(user: current_user, record: @collection_record).first
      @user_flag = Flag.where(user: current_user, record: @collection_record).first
      @user_review = Review.where(user: current_user, record: @collection_record).first
    else
      @user_comment = @user_comment.first
      @user_flag = Flag.where(user: current_user, record: @collection_record).first
      @user_review = Review.where(user: current_user, record: @collection_record).first
    end

    @user_comment_contents = JSON.parse(@user_comment.rawJSON)
    @user_flag = JSON.parse(@user_flag.rawJSON)

    @display_list = []

    JSON.parse(@collection_record.rawJSON)["Collection"].each do |key, value|
      if value.is_a?(String) 
        display_hash = {}
        display_hash[:key] = key
        display_hash[:value] = value
        display_hash[:script] = @script_comment[key]
        display_hash[:reviewer_comment] = @user_comment_contents["Collection"][key]
        display_hash[:flag] = @user_flag["Collection"][key]
        
        @other_users_comments.each_with_index do | comments, index | 
          display_hash[("other_user" + index.to_s).to_sym] = comments["Collection"][key]
        end

        @display_list.push(display_hash)
      end
    end

  end




  def update

    @collection_record = Collection.find_record(params["concept_id"], params["revision_id"])

    #updating comment text
    @user_comment = @collection_record.comments.where(user: current_user).first
    new_comment = JSON.parse(@user_comment.rawJSON)
    params.each do |key, value|
      if key =~ /user_(.*)/
        new_comment["Collection"][$1] = value
      end
    end
    @user_comment.rawJSON = new_comment.to_json
    @user_comment.save!


    #updating flags
    @user_flags = @collection_record.flags.where(user: current_user).first
    new_flags = JSON.parse(@user_flags.rawJSON)
    params.each do |key, value|
      if key =~ /userflag_(.*)/
        new_flags["Collection"][$1] = value
      end
    end
    @user_flags.rawJSON = new_flags.to_json
    @user_flags.save!


    flash[:notice] = "User Comments have been saved"

    redirect_to review_path(id: 1, concept_id: params["concept_id"], revision_id: params["revision_id"])
  end


end