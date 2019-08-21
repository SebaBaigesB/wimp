# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
