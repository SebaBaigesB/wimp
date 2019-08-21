# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.destroy_all

Tag.create!(title: "Tree nut", category: 0)
Tag.create!(title: "Peanut", category: 0)
Tag.create!(title: "Milk", category: 0)
Tag.create!(title: "Egg", category: 0)
Tag.create!(title: "Soy", category: 0)
Tag.create!(title: "Wheat", category: 0)
Tag.create!(title: "Fruit", category: 0)
Tag.create!(title: "Alpha-gal", category: 0)
Tag.create!(title: "Corn", category: 0)
Tag.create!(title: "Garlic", category: 0)

