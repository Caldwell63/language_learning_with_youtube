class CreateVideo
  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def call
    @video = Video.new(
      youtube_id: youtube_id,
      level: AnalizeLevel.new(words).call,
      subtitle: words,
      vocabulary: LearningSuggestion.new(words).call
    )
    add_info
    @video
  end

  private

  def youtube_id
    @youtube_id ||= ExtractYoutubeId.new(@youtube_url).call
  end

  def words
    @words ||= FetchYoutubeSubtitles.new(youtube_id).call
  end

  def add_info
    key = ENV['GOOGLE_API_KEY']

    url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{youtube_id}&key=#{key}"
    response = open(url).read

    text = JSON.parse(response)

    title = text["items"].first["snippet"]["title"]
    description = text["items"].first["snippet"]["description"]
    thumbnails = text["items"].first["snippet"]["thumbnails"]["default"]["url"]
    channel = text["items"].first["snippet"]["channelTitle"]
    tags = text["items"].first["snippet"]["tags"]

    @video.tags = tags
    @video.channel = channel
    @video.thumbnails = thumbnails
    @video.title = title
    @video.description = description
    @video.save
  end
end


