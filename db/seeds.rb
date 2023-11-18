Booking.destroy_all
Dog.destroy_all
User.destroy_all
# destroy database before seeding
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'open-uri'
descriptions = ["Is a good boy", "likes treats", "Literal terrorist"]
breeds = ["bluetick", "boxer", "bulldog/english", "bulldog/french"]
dog_names = [
  "Bella", "Max", "Lucy", "Charlie", "Molly",
  "Buddy", "Daisy", "Bailey", "Maggie", "Sophie",
  "Luna", "Rocky", "Sadie", "Toby", "Chloe",
  "Coco", "Duke", "Zoe", "Riley", "Jack"
]
addresses = [
  "Kloof Street, Gardens, Cape Town",
  "Long Street, City Bowl, Cape Town",
  "Camps Bay Drive, Camps Bay, Cape Town",
  "Bree Street, City Centre, Cape Town",
  "Adderley Street, Foreshore, Cape Town",
  "Loop Street, City Bowl, Cape Town",
  "Main Road, Sea Point, Cape Town",
  "High Level Road, Fresnaye, Cape Town",
  "Victoria Road, Clifton, Cape Town",
  "Beach Road, Mouille Point, Cape Town"
]


user = User.new(email: "dogwalking@gmail.com", password: "pathword")
user.save

dog = Dog.new(name: "Fred", description: "Is a good boy", location: "Paarl")
dog.user = user
image_url = 'https://res.cloudinary.com/dis9yhfev/image/upload/v1699703993/charlesdeluvio-K4mSJ7kc0As-unsplash_mvgvvf.jpg'
dog.photo.attach(io: URI.open(image_url), filename: 'dog.jpg', content_type: 'image/jpg')
dog.save

# booking = Booking.new(date: "2023/11/02", comment: "Very excited")
# booking.user = user
# booking.dog = dog
# booking.save

user = User.new(email: "dogwalking2@gmail.com", password: "pathword")
user.save
dog = Dog.new(name: "Bill", description: "likes treats", location: "Claremont, South Africa")
dog.user = user
image_url = 'https://res.cloudinary.com/dis9yhfev/image/upload/v1699703994/hermes-rivera-yeDt1JvaLBQ-unsplash_xavtdo.jpg'
dog.photo.attach(io: URI.open(image_url), filename: 'dog.jpg', content_type: 'image/jpg')
dog.save
# booking = Booking.new(date: "2023/11/21", comment: "Lots of fun")
# booking.user = user
# booking.dog = dog
# booking.save

user = User.new(email: "dogwalking3@gmail.com", password: "pathword")
user.save
dog = Dog.new(name: "Sandy", description: "Literal terrorist", location: "Green Point")
dog.user = user
image_url = 'https://res.cloudinary.com/dis9yhfev/image/upload/v1699703990/jen-b-CvZr-KELh2c-unsplash_gdwotv.jpg'
dog.photo.attach(io: URI.open(image_url), filename: 'dog.jpg', content_type: 'image/jpg')
dog.save
# booking = Booking.new(date: "2023/10/30", comment: "Exhausted")
# booking.user = user
# booking.dog = dog
# booking.save

puts "#{user.email} created a booking with #{dog.name} and booking "

puts 'Creating 10 dogs...'
10.times do
  # dog = Dog.new(
  #   name:    Faker::Name,
  #   address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  #   rating:  rand(0..5)
  # )
  # restaurant.save!

  # Create a user
  # new dog
  # associate dog to user
  # save dog
  # call api for dog images
  # associate with cloudinary
end
puts 'Finished!'
