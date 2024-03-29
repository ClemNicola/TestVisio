class AppointmentType < ApplicationRecord
  belongs_to :advisor
  has_many :appointments
  has_rich_text :description

  validates :duration, numericality: { greater_than_or_equal_to: 0 }
end
