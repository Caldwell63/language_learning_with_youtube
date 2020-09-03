class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @video = Video.find(params[:id])
  end

  def create
    if params["youtube_id"]
      id = params["youtube_id"]
      url ="https://www.youtube.com/watch?v=#{id}"

      @video = CreateVideo.new(url).call
      redirect_to video_path(@video)
    else
      redirect_to root_path
    end
  end
end
