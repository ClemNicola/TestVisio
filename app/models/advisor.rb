class Advisor < ApplicationRecord
# class Advisor < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users, through: :appointments
  has_many :availabilities
  has_many :appointment_types

  validates :bio, presence: true
  validates :speciality, presence: true, inclusion: { in: ['Finance verte', 'Retraite', 'Optimisation fiscale'] }
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence:true
end
