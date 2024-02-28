class AddAdvisorHoursToArchivedAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :archived_appointments, :advisor_hours, :string
  end
end
