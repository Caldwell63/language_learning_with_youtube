class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_to]

  def home
    if params["youtube-query"]
      query = params["youtube-query"]
      @search_results = SearchYoutube.new(query).call
    end

  rescue FetchYoutubeSubtitles::NoSubtitle
    @no_subtitle_error = true
  ensure
    @videos = Video.all
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
