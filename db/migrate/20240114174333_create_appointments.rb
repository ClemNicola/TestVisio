class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :advisor, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
