class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :meal_tags
  has_many :tags, through: :meal_tags

  enum course: { entrée: 0, plat: 1, dessert: 2 }
end
