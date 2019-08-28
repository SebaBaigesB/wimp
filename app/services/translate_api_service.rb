require "google/cloud/translate"

class TranslateApiService
  def initialize
    @project_id = "whatsinmyplate"
    @translate = Google::Cloud::Translate.new(
      project: @project_id,
      keyfile: ENV["GOOGLE_APPLICATION_CREDENTIALS"]
      )
  end

  def call(attrs = {})
    text = attrs[:text]
    local = attrs[:local]
    target = attrs[:target]
    return @translate.translate(text, from: local, to: target).text
  end
end
