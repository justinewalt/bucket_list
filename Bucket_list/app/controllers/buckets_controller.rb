class BucketsController < ApplicationController
	before_action :bucket, except: [:new, :create, :index]

  def index
  flash[:sucess] = "You have been signed in"
 	@buckets = Bucket.all
  @buckets = Bucket.paginate(page: params[:page], per_page: 4) 

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
    @activities = @bucket.activities
    @activities = @bucket.activities.paginate(page: params[:page], per_page: 4) 

  end

  def edit

  end

  def update
    @bucket = Bucket.find(params[:id])
    if @bucket.update(bucket_params)
      redirect_to buckets_path
    else
      render :edit
    end
  end

  def destroy
  	@bucket.destroy
  	redirect_to buckets_path
  end

  private

  	def bucket_params
  		params.require(:bucket).permit(:category, :activities)

  	end

  	def bucket
  		@bucket = Bucket.find(params[:id])
  	end

    
end
