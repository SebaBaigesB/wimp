class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  LOCALES = [:en, :fr, :es, :de, :it, 'zh-CN'.to_sym, :ja, :pt, :ko, :el, :ru, :th]
end
