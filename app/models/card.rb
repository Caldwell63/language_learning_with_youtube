require 'net/http'
require 'json'

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :word

  def get_random_gif
    url="http://api.giphy.com/v1/gifs/search?q=potato&api_key=ZHywSz17b2c6ZeCPWYFz8HTEPJhCtqyR&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    id = result.first[1].first['id']
    puts "https://i.giphy.com/#{id}.gif"
  end
end
