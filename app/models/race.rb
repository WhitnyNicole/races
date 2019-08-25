class Race < ApplicationRecord
  has_many :trainings
  has_many :workouts, through: :trainings
end
