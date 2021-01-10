# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all

5.times do |i|
  Car.create!(
    user_id: i + 1,
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    mpg: Faker::Number.within(range: 8..50),
    fuel_type: 'gasoline'
  )
end
