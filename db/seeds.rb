# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroy User"
Advisor.destroy_all
User.destroy_all

puts "Creating User"

User.create(
  email: "clement@test.com",
  first_name: "Clement",
  last_name: "Nico",
  password: "123456",
  # encrypted_password: "123456"
)

Advisor.create!(
  email: "jean@test.com",
  first_name: "Jean",
  last_name: "Darraud",
  password: "123456",
  # encrypted_password: "123456",
  bio: 'Je suis un conseiller en gestion de patrimoine expérimenté.',
  speciality: 'Finance verte',
)

puts "Creating Advisor"

# if jean.is_advisor?
#   Advisor.create!(
#     user_id: jean.id,
#     bio: 'Je suis un conseiller en gestion de patrimoine expérimenté.',
#     speciality: 'Finance verte',
#     email: jean.email,
#     password: jean.password,
#     encrypted_password: jean.encrypted_password,
#     reset_password_token: jean.reset_password_token,
#     reset_password_sent_at: jean.reset_password_sent_at,
#     remember_created_at: jean.remember_created_at,
#     first_name: jean.first_name,
#     last_name: jean.last_name,
#   )
# end
