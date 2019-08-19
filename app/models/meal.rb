class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :meal_tags
end
