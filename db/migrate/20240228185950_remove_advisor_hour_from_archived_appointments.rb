class RemoveAdvisorHourFromArchivedAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :archived_appointments, :advisor_hour, :string
  end
end
