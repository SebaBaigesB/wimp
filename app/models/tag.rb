class Tag < ApplicationRecord
  has_many :meal_tags
  enum status: { allergy: 0, category: 1 }
  translates :title
  after_create :translates_with_api

  def translates_with_api
    translator = TranslateApiService.new
    TAG::LOCALES.select { |l| l != I18n.locale }.each do |l|
      translate_title = translator.call(text: self.title, local: I18n.locale, target: l)
      self.attributes = { title: translate_title, locale: l }
      self.save
    end
  end
end
