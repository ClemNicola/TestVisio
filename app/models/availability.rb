class Availability < ApplicationRecord
  belongs_to :advisor
  # has_many :appointments, through :advisor
end
