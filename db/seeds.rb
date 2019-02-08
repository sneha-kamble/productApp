# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
50.times do
  Product.create(
    name: Faker::Name.unique.name,
    brand: Faker::Superhero.name,
    model: Faker::Company.name,
    year: Faker::Number.number(4),
    ram: Faker::Number.number(2),
    external_storage: Faker::Number.number(2)
  )
end
