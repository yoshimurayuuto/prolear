# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do |n|
  User.create!(name: "Jacob",
               email: "962@gmail.com",
               password: "962@gmail.com",
               password_confirmation: "962@gmail.com",
               )
end


1.times do |n|
  User.create!(name: "Jackson",
               email: "961@gmail.com",
               password: "961@gmail.com",
               password_confirmation: "961@gmail.com",
               )
end


1.times do |n|
  User.create!(name: "Noah",
               email: "960@gmail.com",
               password: "960@gmail.com",
               password_confirmation: "960@gmail.com",
               )
end

1.times do |n|
  User.create!(name: "Noah",
               email: "960@gmail.com",
               password: "960@gmail.com",
               password_confirmation: "960@gmail.com",
               )
end


