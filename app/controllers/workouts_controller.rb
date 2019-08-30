class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find_by(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.
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
    params.require(:workout).permit(:user_id, :name, :distance, :pace, :category)
  end
end
