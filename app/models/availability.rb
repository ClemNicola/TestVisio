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

  def time_slots_day(date)
    all_slots = []
    advisor_availabilities = Availability.where(advisor_id: self.advisor_id)

    day_availabilities = advisor_availabilities.select{ |availability| availability.covers_day?(date)}

    start_day = day_availabilities.map(&:start_time).min
    end_day = day_availabilities.map(&:end_time).max

    if start_day && end_day
      current_time = start_day

      while current_time < end_day
        slots_covered = day_availabilities.any? do |availability|
          availability.covers_day?(date) && current_time >= availability.start_time && current_time < availability.end_time
        end
        all_slots << (slots_covered ? current_time.strftime('%H:%M') : "none")

        current_time += 30.minutes
      end
    end
    all_slots
  end
  # def time_slots
  #   slots = []
  #   current_time = start_time

  #   while current_time < end_time
  #     slots << current_time
  #     current_time += 30.minutes
  #   end
  #   slots
  # end


  private

  def set_default_times
    self.start_time ||= '09:00'
    self.end_time ||= '18:00'
  end
end
