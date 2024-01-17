class AppointmentType < ApplicationRecord
  belongs_to :advisor
  has_many :appointments
  has_rich_text :description
end
