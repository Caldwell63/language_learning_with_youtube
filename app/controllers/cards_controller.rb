class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
    @card = Card.new(card_params)
    @card.save
  end

  def create
  end

  def update
  end

  # private

  def card_params
    params.require(:card).permit(:stage, :known_on)
  end
end
