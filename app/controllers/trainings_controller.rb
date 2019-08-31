class TrainingsController < ApplicationController

def new
  if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
    @training = @workout.trainings.build
  else
    @training = Training.new
    @training.build_workout
  end
end

def create
  @training = Training,new(training_params)
  if @training.save
    redirect_to training_path(@training)
  else
    @workout = Workout.find_by_id(params[:workout_id])
    render :new
  end
end

def index
  if params[:workout_id] && workout = Workout.find_by_id(params[:workout_id])
    @trainings = workout.trainings
  else
    @trainings = Training.all
  end
end


def show
  @training = Training.find_by(params[:id])
end

private

  def training_params
    params.require(:training).permit(:date, :feeling,
      :race_id, :workout_id, workout_attributes: [:name,
        :category, :pace, :distance, :user_id])
  end
end
