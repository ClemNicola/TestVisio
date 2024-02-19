class Advisor < ApplicationRecord
# class Advisor < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :users, through: :appointments
  has_many :availabilities, dependent: :destroy
  has_many :appointment_types, dependent: :destroy
  has_many :appointments

  validates :bio, presence: true
  validates :speciality, presence: true, inclusion: { in: ['Finance Verte', 'Retraite', 'Optimisation fiscale'] }
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  def available_on?(date, advisor_hours, appointment_type_id)

    appointment_duration = AppointmentType.find(appointment_type_id).duration
    Rails.logger.info "Raw Date: #{date.inspect}, Advisor Hours: #{advisor_hours}"

    date = date.to_s
    date = Time.zone.parse(date).to_date
    time = Time.zone.parse(advisor_hours).seconds_since_midnight.seconds

    parsed_time = date + time

    appointment_end_time = parsed_time + appointment_duration.minutes

    # day_of_week = parsed_time.strftime('%A').downcase

    Rails.logger.info "Processed Date: #{date}, Parsed Time: #{parsed_time}, Appointment End Time: #{appointment_end_time}"
    # Rails.logger.info "Day of Week: #{day_of_week}"

    availabilities.each do |availability|
      # next unless availability[day_of_week]
      next unless availability.covers_day?(parsed_time)

      availability_start = availability.start_time.change(year: parsed_time.year, month: parsed_time.month, day: parsed_time.day)
      availability_end = availability.end_time.change(year: appointment_end_time.year, month: appointment_end_time.month, day: appointment_end_time.day)

      return true if availability_start <= parsed_time && availability_end >= appointment_end_time
    end
    false

  end
end
