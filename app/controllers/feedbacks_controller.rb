class FeedbacksController < ApplicationController
  # GET /feedbacks/new
  def new
  end

  # POST /feedbacks
  def create
    # from = feedback_params[:from]
    # comment = feedback_params[:comment]
    @feedback = Feedback.new(feedback_params)

    # if from.present? && comment.present?
    if @feedback.valid?
      # Notifications.feedback(from, comment).deliver
      Notifications.feedback(@feedback.from, @feedback.comment).deliver
      redirect_to root_path, notice: 'Feedback was successfully created.'
    else
      flash.now.alert = 'From and comment must be present.'
      render action: 'new'
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:from, :comment)
    end
end
