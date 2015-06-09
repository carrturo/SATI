class FeedbacksController < ApplicationController
  before_action :admin_signed_in, only: [:index,:show]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    #@date = @feedback.created_at
    #@date = @date.new_offset("+09:00")
    #@feedback.created_at = @date
    respond_with(@feedback)
  end

  def new
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params)
    
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feedback.update(feedback_params)
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:age, :title, :message)
    end
end
