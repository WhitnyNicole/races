class RenameSessionsToTrainings < ActiveRecord::Migration[5.2]
  def change
    rename_table :sessions, :trainings
  end
end
