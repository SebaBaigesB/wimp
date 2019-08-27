
puts "Creating user"
user = User.create(email: 'coco@example.com', password: 'azerty', role: 'owner', nickname: 'supercoco')
user = User.create(email: 'seb@example.com', password: 'azerty', role: 'user')


puts "Creating restaurants"
  name = Faker::Restaurant.name
  food_style_random = rand(6)
  type = Restaurant.food_styles.keys[food_style_random]
  address = "107 cours balguerie stuttenberg 33300 bordeaux France"
  r = Restaurant.new(user: user, name: name, food_style: type, address: address)
  r.save
  # desc = Faker::Restaurant.description

puts "Creating user"
user = User.create(email: 'xavier@example.com', password: 'azerty')

puts "Creating restaurants"
  name = Faker::Restaurant.name
  food_style_random = rand(6)
  type = Restaurant.food_styles.keys[food_style_random]
  address = "90 Cours du Médoc 33300 Bordeaux  France"
  r = Restaurant.new(user: user, name: name, food_style: type, address: address)
  r.save
  # desc = Faker::Restaurant.description

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

puts "Creating tags"
Tag.destroy_all

Tag.create!(title: "Tree nut", status: 0)
Tag.create!(title: "Peanut", status: 0)
Tag.create!(title: "Milk", status: 0)
Tag.create!(title: "Egg", status: 0)
Tag.create!(title: "Soy", status: 0)
Tag.create!(title: "Wheat", status: 0)
Tag.create!(title: "Fruit", status: 0)
Tag.create!(title: "Alpha-gal", status: 0)
Tag.create!(title: "Corn", status: 0)
Tag.create!(title: "Garlic", status: 0)

Tag.create!(title: "Vegan", status: 1)
Tag.create!(title: "Vegetarian", status: 1)
Tag.create!(title: "Organic", status: 1)
Tag.create!(title: "Homemade", status: 1)
Tag.create!(title: "Halal", status: 1)
Tag.create!(title: "Casher", status: 1)
