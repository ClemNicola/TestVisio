class RemoveStartTimeFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :start_time, :datetime
    remove_column :appointments, :end_time, :datetime
  end
end
