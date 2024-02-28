class CreateArchivedAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :archived_appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :advisor, null: false, foreign_key: true
      t.references :appointment_type, null: false, foreign_key: true
      t.datetime :date
      t.string :advisor_hour
      t.integer :status
      t.string :reason

      t.timestamps
    end
  end
end
