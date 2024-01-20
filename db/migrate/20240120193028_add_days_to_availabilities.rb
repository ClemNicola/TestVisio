class AddDaysToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_column :availabilities, :monday, :boolean
    add_column :availabilities, :tuesday, :boolean
    add_column :availabilities, :wednesday, :boolean
    add_column :availabilities, :thursday, :boolean
    add_column :availabilities, :friday, :boolean
    add_column :availabilities, :saturday, :boolean
    add_column :availabilities, :sunday, :boolean
  end
end
