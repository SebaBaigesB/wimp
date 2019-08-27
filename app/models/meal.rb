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
    translator = TranslateApiService.new
    Meal::LOCALES.select { |l| l != I18n.locale }.each do |l|
      translate_description = translator.call(text: self.description, local: I18n.locale, target: l)
      translate_name = translator.call(text: self.name, local: I18n.locale, target: l)
      self.attributes = { name: translate_name, description: translate_description, locale: l }
      self.save
    end
  end
end
