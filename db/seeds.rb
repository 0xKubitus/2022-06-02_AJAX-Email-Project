# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


Email.delete_all
Email.destroy_all


7.times do
  new_email = Email.create(object: Faker::Movies::StarWars.quote, body: Faker::Quote.yoda, read: false)
end

3.times do
  new_email = Email.create(object: Faker::Movies::StarWars.quote, body: Faker::Quote.yoda, read: true)
end