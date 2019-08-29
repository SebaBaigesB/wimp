class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  LOCALES = [:en, :fr, :es, :de, :it, 'zh-CN'.to_sym, :ja, :pt, :ko, :el, :ru, :th]

  FLAGS = {
   en: "united-kingdom.png",
   fr: "france.png",
   de: "germany.png",
   it: "italy.png",
   ja: "japan.png",
   pt: "portugal.png",
   ko: "south-korea.png",
   es: "spain.png",
   "zh-CN".to_sym => "china.png",
   el: "greece.png",
   th: "thailand.png",
   ru: "russia.png"
  }
end
