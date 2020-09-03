class Translate
  def initialize(word,language)
    @word = word
    @language = language
  end

  def call
    fetch_translation
  end

  private

  def fetch_translation
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://translated-mymemory---translation-memory.p.rapidapi.com/api/get?mt=1&onlyprivate=0&de=a%40b.c&langpair=en|#{@language}&q=#{@word}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'translated-mymemory---translation-memory.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['RAKUTEN_API_KEY']

    response = http.request(request)
    body = response.read_body
    data = JSON.parse(body)
    data["responseData"]["translatedText"]
  end
end
