class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @video = Video.find(params[:id])
  end
end
