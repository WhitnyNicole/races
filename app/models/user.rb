class User < ApplicationRecord
  has_many :completed_workouts, foreign_key: "user_id", class_name: "Workout"
  has_many :races
  has_many :completed_workouts, through: :races, source: :workouts
  has_secure_password
  
end
