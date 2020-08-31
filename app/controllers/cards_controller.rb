class CardsController < ApplicationController
  def index

  end
  def show

  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create

  end

  def update

  end



end
