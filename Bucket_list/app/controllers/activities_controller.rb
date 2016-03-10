class ActivitiesController < ApplicationController
  before_action :bucket, only: [:destroy, :edit, :update]
  before_action :activity, only: [:destroy, :edit, :update]

  def edit
  end

  def update
  	if @activity.update(activity_params)
  		redirect_to buckets_path(@bucket, @activity)
  	else
  		render :edit
  	end
  end

  def new
    @bucket = Bucket.find(params[:bucket_id])
    @activity = Activity.new
  end

  def create
    @bucket = Bucket.find(params[:bucket_id])
  	@activity = @bucket.activities.new(activity_params)
    
    # @activity = Activity.new(activity_params)
    # @activity.bucket_id = params[:bucket_id]
    
  	if @activity.save
  		redirect_to bucket_path(@bucket)
  	else
  		render :new
  	end
  end

  def destroy
    @activity = Activity.find(params[:id])
  	@activity.destroy
  	redirect_to bucket_path(@bucket)
  end

  private

  	def activity_params
  		params.require(:activity).permit(:name)
  	end

  	def bucket
  		@bucket = Bucket.find(params[:bucket_id])
  	end  

  	def activity
  		@activity = @bucket.activities.find(params[:id])
  	end

end
