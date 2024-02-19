class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :advisor
  belongs_to :appointment_type

  validate :check_availability
  validates :date, :advisor_hours, presence: true

  enum status: { pending: 0, approved: 1, unapproved: 2 }

  def end_time
    advisor_time = Time.parse(advisor_hours)
    advisor_time + appointment_type.duration.minutes
  end

  def check_availability
    unless advisor.available_on?(date, advisor_hours, appointment_type_id)
      errors.add(:base, "Advisor is not available on the selected date and time")
    end
  end

end
