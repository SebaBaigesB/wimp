class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  enum food_style: { french: 0, italian: 1, japanese: 2, chinese: 3, pubs: 4, others: 5 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  translates :story
   mount_uploader :photo, PhotoUploader

  after_create :translates_with_api

  def translates_with_api
    translator = TranslateApiService.new
    Restaurant::LOCALES.select { |l| l != I18n.locale }.each do |l|
      translate_story = translator.call(text: self.story, local: I18n.locale, target: l)
      self.attributes = { story: translate_story, locale: l }
      self.save
    end
  end
end
