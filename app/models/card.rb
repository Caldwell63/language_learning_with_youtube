require 'net/http'
require 'json'


class Card < ApplicationRecord
  belongs_to :user
  belongs_to :word


  def fillout
    card = self
    word_en = card.word.en
    card.gif = card.get_gif(word_en)
    # card.add_translation(word_en)
    card.save
  end



  def add_translation(word_en)
    translate_to = self.user.native_language
    # api_to translate word_en
  end


  def get_gif(word_en)

    api_key = ENV['GIFY_API_KEY']
    url = "http://api.giphy.com/v1/gifs/search?q=#{word_en}&api_key=#{api_key}&limit=1"

    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    id = result.first[1].first['id']
    "https://i.giphy.com/#{id}.gif"
  end

end
