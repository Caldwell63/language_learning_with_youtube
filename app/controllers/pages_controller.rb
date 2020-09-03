class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_to]

  def home
    url = params["youtube-url"]
    # result = Word.new.get_level(url) if params["youtube-url"]
    # CreateVideo.new(url).call if params["youtube-url"]

    if params["youtube-url"]
      CreateVideo.new(url).call
      @video = Video.last
      redirect_to video_path(@video)
    end

    if params[:query].present?
      @videos = Video.search(params[:query])
    else
      @videos = Video.all
    end

    if params[:level].present?
      case params[:level]
      when "A1"
        @videos = @videos.level_1
      when "A2"
        @videos = @videos.level_2
      when "B1"
        @videos = @videos.level_3
      when "B2"
        @videos = @videos.level_4
      when "C1"
        @videos = @videos.level_5
      when "C2"
        @videos = @videos.level_6
      end
    end

  rescue FetchYoutubeSubtitles::NoSubtitle
    @no_subtitle_error = true
  end

  def how_to
  end
end
