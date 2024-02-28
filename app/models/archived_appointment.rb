class ArchivedAppointment < ApplicationRecord
  belongs_to :user
  belongs_to :advisor
  belongs_to :appointment_type
end
