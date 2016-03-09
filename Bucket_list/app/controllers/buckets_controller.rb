class BucketsController < ApplicationController
	before_action :bucket, except: [:new, :create, :index]

  def index
  flash[:sucess] = "You have been signed in"
 	@buckets = Bucket.all
  end

  def new
  	@bucket = current_user.buckets.new
  end

  def create
  	@bucket = current_user.buckets.new(bucket_params)
  	if @bucket.save
  		redirect_to buckets_path
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  	if @bucket.update(@bucket)
  		redirect_to bucket_path(@bucket)
  	else
  		render :edit
  	end
  end

  def update
  end

  def destroy
  	@bucket.destroy
  	redirect_to buckets_path
  end

  private

  	def bucket_params
  		params.require(:bucket).permit(:category)

  	end

  	def bucket
  		@bucket = Bucket.find(params[:id])
  	end
end
