class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_to]

  def home
    # if params["youtube-query"].present?
    #   query = params["youtube-query"]
    #   @search_results = SearchYoutube.new(query).call
    # end

    if params[:query].present?
      @videos = Video.search(params[:query])
      # render root_path(anchor: "search")
    else
      @videos = Video.all
    end

    if params[:level].present?
      case params[:level]
      when "Beginner"
        @videos = @videos.level_1
      when "Intermediate"
        @videos = @videos.level_2
      when "Advanced"
        @videos = @videos.level_3
      when "All"
        @videos = @videos.level_4
      end
      # redirect_to root_path(anchor: "search")
    end

  rescue FetchYoutubeSubtitles::NoSubtitle
    @no_subtitle_error = true
  end

  def how_to
  end

  def search
    if params["youtube-query"].present?
      query = params["youtube-query"]
      @search_results = SearchYoutube.new(query).call

      render layout: false
    end
  end
end
