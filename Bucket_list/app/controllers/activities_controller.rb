class ActivitiesController < ApplicationController


  def edit
  end

  def update
  	if @activities.update(activities_params)
  		redirect_to buckets_path(@category, @activities)
  	else
  		render :edit
  	end
  end

  def new
  	@activities = Activity.new
  end

  def create
  	@activities = @category.activities.new(activities_params)
  	if @activities.save
  		redirect_to buckets_path(@category)
  	else
  		render :new
  	end
  end

  def destroy
  	@activities.destroy
  	redirect_to buckets_path(@category)
  end

  private

  	def activities_params
  		params.require(:activities).permit(:name)
  	end

  	def category
  		@category = Category.find(params[:category_id])
  	end

  	def activities
  		@activities = @category.activities.find(params[:id])
  	end

end
