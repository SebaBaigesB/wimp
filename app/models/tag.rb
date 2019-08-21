class Tag < ApplicationRecord
  has_many :meal_tags
  enum status: { non: 0, oui: 1 }
end
