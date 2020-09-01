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
    card.save!
    redirect_to cards_path
  end

  def update

  end

  def fillout
    word_en = self.en
    self.add_gif(word_en)
    self.add_translation(word_en)
    self.save
  end

  def add_gif(word_en)
    api call on gifi #{word_en}
    self.gif = gif
  end

  def add_translation(word_en)
    translate_to = self.user #motherlanguage
    # api_to translate word_en
  end

  private

  def card_params
    params.require(:card).permit(:word_id)
  end

end
