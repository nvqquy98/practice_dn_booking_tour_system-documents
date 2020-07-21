# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
User.create!(name: "Example User", email: "example@railstutorial.org",
              password: "foobar",
              password_confirmation: "foobar",
              permission: 1,
              address: Faker::Address.full_address,
              activated: true,
              activated_at: Time.zone.now)

# Generate a bunch of additional users.
59.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.subscriber_number(length = 10)
  User.create!(name: name, email: email,
            password: password,
            password_confirmation: password,
            address: address,
            phone_number: phone_number,
            activated: true,
            activated_at: Time.zone.now)
end
# Category
Category.create!(city: "Da nang", area: 0)
Category.create!(city: "Hue", area: 0)
Category.create!(city: "Hoi An", area: 0)
Category.create!(city: "Ha noi", area: 0)
Category.create!(city: "Ho Chi Minh", area: 0)
Category.create!(city: "California", area: 1)
Category.create!(city: "Korola Megna", area: 1)
Category.create!(city: "LonDon", area: 1)
Category.create!(city: "Paris", area: 1)
Category.create!(city: "Miami Beach", area: 1)

# Tour
categorys = Category.order(:created_at).take(6)

2.times do
  categorys.each do |category|
    title = Faker::Lorem.sentence(5)
    rate = rand(1..5)
    price = Faker::Number.decimal(l_digits = 4,r_digits = 2)
    category.tours.create!(title: title,
                                 rate: rate,
                                 price: price)
  end
end

# create tour_details
20.times do
    sale = Faker::Number.decimal(l_digits = 0, r_digits = 2)
    price = Faker::Number.decimal(l_digits = 4,r_digits = 2)
    maximum_people = 20
    current_people = 10 + rand(1..10)
    tour_id = rand(1..12)
    start_at = Faker::Date.forward(days =365 )
    TourDetail.create!(tour_id: tour_id,
                      sale: sale,
                      price: price,
                      maximum_people: maximum_people,
                      current_people: current_people,
                      start_at: start_at)
end
