class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  translates :content
  validates :content, presence: true
  after_create :translates_with_api

  def translates_with_api
    translator = TranslateApiService.new
    Review::LOCALES.select { |l| l != I18n.locale }.each do |l|
      translate_content = translator.call(text: self.content, local: I18n.locale, target: l)
      self.attributes = { content: translate_content, locale: l }
      self.save
    end
  end
end
