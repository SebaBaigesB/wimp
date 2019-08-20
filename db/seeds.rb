puts "Creating user"
user = User.create(email: 'coco@example.com', password: 'azerty')

puts "Creating restaurants"
10.times do
  name = Faker::Restaurant.name
  type = Faker::Restaurant.type
  r = Restaurant.new(user: user, name: name, food_style: type)
  r.save
  # desc = Faker::Restaurant.description
end
