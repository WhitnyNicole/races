class WorkoutsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = @current_user.
    created_workouts.build(
      workout_params)
      if @workout.save
        redirect_to workout_path(@workout)
      else
        render :new
      end
  end

private
  def workout_params
    params.require[:workout].permit(:name, :distance, :pace, :category)
  end
end
