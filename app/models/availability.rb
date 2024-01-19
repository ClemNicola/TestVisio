class Availability < ApplicationRecord
  belongs_to :advisor
  # has_many :appointments, through :advisor
  validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
