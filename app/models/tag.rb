class Tag < ApplicationRecord
  has_many :meal_tags
  enum status: { allergy: 0, category: 1 }
  translates :title
end
