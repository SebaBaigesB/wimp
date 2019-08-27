class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :meal_tags
  has_many :tags, through: :meal_tags

  STATUSES = ["Entry", "Main", "Dessert"]
  validates :course, inclusion: {in: STATUSES}

  mount_uploader :photo, PhotoUploader
  translates :name, :description
  after_create :translates_with_api

  def translates_with_api

    end

end
