class RemoveUserIdFromAppointmentTypes < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointment_types, :user_id, :bigint
  end
end
