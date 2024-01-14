class RemoveFromAppointmentType < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointment_types, :appointment_id, :integer
  end
end
