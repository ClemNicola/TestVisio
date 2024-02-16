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
  validates :password, presence:true

  def available_on?(date, time, appointment_type_id)

    appointment_duration = AppointmentType.find(appointment_type_id).duration
    parsed_time = Time.parse("#{date} #{time}")
    appointment_end_time = parsed_time + appointment_duration.minutes

    availabilities.any? do |availability|
      availability.covers_day?(date) && time_within_availability?(availability, parsed_time, appointment_end_time)
    end
  end

  private

  def time_within_availability?(availability, start_time, end_time)
    availability.start_time >= start_time && availability.end_time >= end_time
  end
end
