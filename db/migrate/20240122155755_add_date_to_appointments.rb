class AddDateToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :date, :datetime
  end
end
