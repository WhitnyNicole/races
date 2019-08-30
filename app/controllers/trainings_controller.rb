class TrainingsController < ApplicationController

def new
  @training = Training.new
  @training.build_workout
end

def create
  @training = Training,new(training_params)
  if @training.save
    redirect_to training_path(@training)
  else
    render :new
  end
end

def show
  @training = Training.find_by(params[:id])
end

private

  def training_params
    params.require(:training).permit(:date, :feeling,
      :race_id, :workout_id, :workout_attributes:[:name,
        :category, :pace, :distance])
  end
end
