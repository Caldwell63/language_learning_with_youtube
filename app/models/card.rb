require 'net/http'
require 'json'


class Card < ApplicationRecord
  belongs_to :user
  belongs_to :word
  

  def get_random_gif(word)
    api_key = ENV['GIFY_API_KEY']
    url = "http://api.giphy.com/v1/gifs/search?q=#{word}&api_key=#{api_key}&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    id = result.first[1].first['id']
    puts "https://i.giphy.com/#{id}.gif"
  end
end
