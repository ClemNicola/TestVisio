class RemoveElementsFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :date, :datetime
    remove_column :appointments, :time, :datetime
  end
end
