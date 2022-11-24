require 'faker'
require "open-uri"

puts 'Destroying users and dogs 🌱'

Booking.destroy_all
Dog.destroy_all
User.destroy_all

puts 'Seeding db 🌱'

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  2.times do
    dog = Dog.new(
      name: Faker::Creature::Dog.name,
      breed: Faker::Creature::Dog.breed,
      description: "Humans's best friend",
      dog_image: Faker::LoremFlickr.image,
      user_id: user.id
    )
    file = URI.open("https://source.unsplash.com/random/?dog")
    dog.photo.attach(io: file, filename: "name.png", content_type: "image/png")
    dog.save
  end
  puts "User #{user.first_name} has been created with dogs"
end

puts 'Finished ✅'
