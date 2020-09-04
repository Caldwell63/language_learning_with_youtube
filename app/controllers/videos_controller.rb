class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    if params[:query].present?
      @videos = Video.search(params[:query])
    else
      @videos = Video.all
    end

    render json: @videos.order(:title).limit(10)
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    if params["youtube_id"]
      id = params["youtube_id"]
      url ="https://www.youtube.com/watch?v=#{id}"

      @video = CreateVideo.new(url).call
      redirect_to video_path(@video)
      # render json: @video, status: :ok
    else
      # render json: { error: "" }, status: :bad_request
      redirect_to root_path
    end

  rescue FetchYoutubeSubtitles::NoSubtitle
    @no_subtitle_error = true
    # render json: { error: "Subtitle not present" }, status: :bad_request
  end
end
