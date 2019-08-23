# Imports the Google Cloud client library
require "google/cloud/translate"

# Your Google Cloud Platform project ID
project_id = "wimp-1566554178866"

# Instantiates a client
translate = Google::Cloud::Translate.new project: project_id

# The text to translate
text = "Un petit repas des familles"
# The target language
local = "fr"

target = "en"

# Translates some text into Russian
translation = translate.translate text, from: local, to: target

puts "Text: #{text}"
puts "Translation: #{translation}"

# return translate.translate text, from: local, to: target
