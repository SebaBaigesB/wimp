require "google/cloud/translate"


class TranslateApiService
  def initialize
    @project_id = "wimp-1566554178866"
    @translate = Google::Cloud::Translate.new project: @project_id
  end

  def call(attrs = {})
    text = attrs[:text]
    local = attrs[:local]
    target = attrs[:target]
    return @translate.translate(text, from: local, to: target).text
  end
end