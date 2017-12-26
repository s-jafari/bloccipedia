# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create a member
member = User.new(
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save!

# Create an admin user
admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create a premium user
premium = User.create!(
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!

5.times do
  User.create!(email: Faker::Internet.email, password: "123456")
end

10.times do
  Wiki.create(user: User.order("RANDOM()").first, title: Faker::LordOfTheRings.unique.character, body: Faker::Hobbit.quote)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
