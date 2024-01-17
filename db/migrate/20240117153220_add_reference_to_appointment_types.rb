class AddReferenceToAppointmentTypes < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointment_types, :advisor, null: false, foreign_key: true
  end
end
