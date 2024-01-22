class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :advisor
  belongs_to :appointment_type

  validate :check_availability
  validates :date, :time, presence: true

  enum status: { pending: 0, approved: 1, unapproved: 2 }

  def check_availability
    unless advisor.available_on?(date, time)
      errors.add(:base, "Advisor is not available on the selected date and time")
    end
  end

end
