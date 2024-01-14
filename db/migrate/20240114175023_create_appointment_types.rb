class CreateAppointmentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_types do |t|
      t.string :name
      t.string :location
      t.string :color, default: "#000000"
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
