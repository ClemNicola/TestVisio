class AddElementsToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :advisor_hours, :string
    add_column :appointments, :first_name, :string
    add_column :appointments, :last_name, :string
    add_column :appointments, :mobile, :string
  end
end
