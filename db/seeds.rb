puts "Creating user"
user = User.create(email: 'coco@example.com', password: 'azerty')

puts "Creating restaurants"
10.times do
  name = Faker::Restaurant.name
  type = Faker::Restaurant.type
  address = "Bordeaux"
  r = Restaurant.new(user: user, name: name, food_style: type, address: address)
  r.save
  # desc = Faker::Restaurant.description
end
puts "Creating meals"
5.times do
  starter = Faker::Food.dish
  main_course = Faker::Food.vegetables
  dessert = Faker::Food.fruits
  s = Meal.new( name: starter, restaurant_id: 1)
  mc = Meal.new( name: main_course, restaurant_id: 1)
  d = Meal.new( name: dessert, restaurant_id: 1)
  s.save
  mc.save
  d.save
end
