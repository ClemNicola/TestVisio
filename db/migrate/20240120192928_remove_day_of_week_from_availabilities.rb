class RemoveDayOfWeekFromAvailabilities < ActiveRecord::Migration[7.1]
  def change
    remove_column :availabilities, :day_of_week, :integer
  end
end
