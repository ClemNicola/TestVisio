# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

cities = %w[Paris Bordeaux Nantes Lyon Marseille Strasbourg Lille]

specialities = ['Vélo', 'Vélo vintage', 'VAE', 'Vélo Cargo']

bio = ["Nous avons tout l'équipement nécessaire pour réparer et entretenir tous types de vélos.",
  "Mon atelier est équipé des dernières technologies pour diagnostiquer précisément les problèmes.",
  "Je garde une large sélection de pièces détachées pour pouvoir réparer votre vélo rapidement.",
  "L'atelier dispose d'un espace dédié à la personnalisation et à la modification de vélos.",
  "J'utilise uniquement des outils de haute qualité pour garantir les meilleures réparations.",
  "Notre zone de travail est organisée pour traiter efficacement chaque vélo qui nous est confié.",
  "Je me tiens à jour avec les dernières innovations en matière de vélo pour offrir le meilleur service possible.",
  "L'atelier est conçu pour offrir une expérience complète, de la réparation à l'amélioration de performances."
]

names = ["Révision complète et entretien préventif ", "Réparation spécifique", "Montage personnalisé et mise à niveau"]
locations = ["En magasin", "A domicile", "En entreprise"]
durations = [30, 45, 90]

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

20.times do
  advisor = Advisor.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456",
    bio: bio.sample,
    speciality: specialities.sample,
    address: Faker::Address.street_address,
    city: cities.sample
  )

  names.each do |name|
    AppointmentType.create!(
      advisor_id: advisor.id,
      name: name,
      location: locations.sample,
      duration: durations.sample
    )
  end


  Availability.create!(
    advisor_id: advisor.id,
    start_time: DateTime.now.beginning_of_day + 9.hours,
    end_time: DateTime.now.beginning_of_day + 18.hours,
    monday: false,
    tuesday: true,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: true,
    sunday: false
  )
end

puts "Creating Advisor"
puts "Creating AppointmentType"
puts "Creating Availability"

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
