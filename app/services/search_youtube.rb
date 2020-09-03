class SearchYoutube
  def initialize(query)
    @query = query
  end

  def call
    fetch_results
    create_hash
  end

  private

  def fetch_results
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://youtube-search-results.p.rapidapi.com/youtube-search/?q=#{@query}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'youtube-search-results.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['RAKUTEN_API_KEY']

    response = http.request(request)
    body = response.read_body
    @data = JSON.parse(body)
  end

  def create_hash
    results = @data["items"]
    # @final = results.select! {|item| item['type'] == 'video'}
    @final = []
    results.each do |item|
      @final << item if item['type'] == 'video'
    end
    @final
  end
end
