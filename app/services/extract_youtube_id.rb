class ExtractYoutubeId
  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def call
    @youtube_url.match(/v=(.*)/)[1..-1].first.to_s
  end
end
