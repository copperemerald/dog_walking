Booking.destroy_all
Dog.destroy_all
User.destroy_all
# destroy database before seeding
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


user = User.new(email: "dogwalking@gmail.com", password: "pathword")
user.save

dog = Dog.new(name: "Fred", description: "Is a good boy", location: "Paarl")
dog.user = user
dog.save

booking = Booking.new(date: "2023/11/02", comment: "Very excited")
booking.user = user
booking.dog = dog
booking.save

user = User.new(email: "dogwalking2@gmail.com", password: "pathword")
user.save
dog = Dog.new(name: "Bill", description: "likes treats", location: "Claremont")
dog.user = user
dog.save
booking = Booking.new(date: "2023/11/21", comment: "Lots of fun")
booking.user = user
booking.dog = dog
booking.save

user = User.new(email: "dogwalking3@gmail.com", password: "pathword")
user.save
dog = Dog.new(name: "Sandy", description: "Literal terrorist", location: "Green Point")
dog.user = user
dog.save
booking = Booking.new(date: "2023/10/30", comment: "Exhausted")
booking.user = user
booking.dog = dog
booking.save

puts "#{user.email} created a booking with #{dog.name} and booking #{Booking.count} "
