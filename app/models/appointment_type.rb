class AppointmentType < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_rich_text :description
end
