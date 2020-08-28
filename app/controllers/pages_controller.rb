class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_to ]

  def home
    url = params["youtube-url"]
    result = Word.new.get_level(url) if params["youtube-url"]
    @videos = Video.all
  end

  def how_to
  end

end
