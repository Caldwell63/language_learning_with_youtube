require 'google/api_client'

client = Google::APIClient.new
translate = client.discovered_api('translate', 'v2')

client.authorization.access_token = '123' # dummy
client.key = "my-key-example" # your key from Google API console

response = client.execute(
  :api_method => translate.translations.list,
  :parameters => {
    'format' => 'text',
    'source' => 'en',
    'target' => 'es',
    'q' => 'The quick brown fox jumped over the lazy dog.'
  }
)

status, headers, body = response
puts response.body
