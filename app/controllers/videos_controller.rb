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
end
