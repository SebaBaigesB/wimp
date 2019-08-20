class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :meal_tags
  has_many :tags, through: :meal_tags
end
