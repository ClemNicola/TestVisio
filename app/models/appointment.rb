class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :advisor
  belongs_to :appointment_type

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
