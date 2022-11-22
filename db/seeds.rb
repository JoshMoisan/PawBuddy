require 'faker'

puts 'Seeding db 🌱'

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  2.times do
    Dog.create(
      name: Faker::Creature::Dog.name,
      breed: Faker::Creature::Dog.breed,
      description: "Humans's best friend",
      dog_image: Faker::LoremFlickr.image,
      user_id: user.id
    )
  end
  puts "User #{user.first_name} has been created with dogs"
end

puts 'Finished ✅'
