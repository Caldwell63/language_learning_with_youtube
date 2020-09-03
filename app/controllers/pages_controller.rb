class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_to]

  def home
    if params["youtube-query"]
      query = params["youtube-query"]
      @search_results = SearchYoutube.new(query).call
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
      # redirect_to root_path(anchor: "search")
    end

  rescue FetchYoutubeSubtitles::NoSubtitle
    @no_subtitle_error = true
  end

  def how_to
  end

  def search
    if params["youtube-query"]
      query = params["youtube-query"]
      @search_results = SearchYoutube.new(query).call

      render layout: false
    end
  end
end
