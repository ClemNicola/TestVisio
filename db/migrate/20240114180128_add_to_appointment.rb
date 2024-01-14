class AddToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :appointment_type_id, :integer
  end
end
