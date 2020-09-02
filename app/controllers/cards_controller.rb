class CardsController < ApplicationController

  def index
    @cards = current_user.cards
    @card = Card.new
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
  end

  def create
    card = Card.new(card_params)
    card.user = current_user
    card.fillout
    card.save!
    redirect_to cards_path
  end

  def update

  end



  private

  def card_params
    params.require(:card).permit(:word_id)
  end

end
