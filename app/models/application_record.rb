class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  LOCALES = [:en, :fr, :es, :de, :it, :cn, :jp, :pt, :ko, :gk, :ru, :th]
end
