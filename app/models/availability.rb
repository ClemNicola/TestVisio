class Availability < ApplicationRecord
  belongs_to :advisor
  # has_many :appointments, through :advisor
  # validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  before_validation :set_default_times, on: :create

  # DAYS_OF_WEEK = {
  #   'Monday' => 0,
  #   'Tuesday' => 1,
  #   'Wednesday' => 2,
  #   'Thursday' => 3,
  #   'Friday' => 4,
  #   'Saturday' => 5,
  #   'Sunday' => 6
  # }

  # def self.day_of_week_options
  #   DAYS_OF_WEEK.map { |name, number| [name, number] }
  # end
  def covers_day?(date)
    day_of_week = date.strftime('%A').downcase
    self[day_of_week]
  end
  
  private

  def set_default_times
    self.start_time ||= '09:00'
    self.end_time ||= '18:00'
  end
end
