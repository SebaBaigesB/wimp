class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :reviews, dependent: :destroy
  enum food_style: { french: 0, italian: 1, japanese: 2, chinese: 3, pubs: 4, others: 5 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
