class Video < ApplicationRecord
  validates :youtube_id, uniqueness: true

  def add_info
    id = self.youtube_id
    key = ENV['GOOGLE_API_KEY']

    url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{id}&key=#{key}"
    response = open(url).read

    text = JSON.parse(response)

    title = text["items"].first["snippet"]["title"]
    description = text["items"].first["snippet"]["description"]
    thumbnails = text["items"].first["snippet"]["thumbnails"]["default"]["url"]
    channel = text["items"].first["snippet"]["channelTitle"]
    tags = text["items"].first["snippet"]["tags"]

    self.tags = tags
    self.channel = channel
    self.thumbnails = thumbnails
    self.title = title
    self.description = description
    self.save
 end
end
