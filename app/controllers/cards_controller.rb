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
    word_en = self.word.en
    self.gif = self.get_gif(word_en)
    # self.add_translation(word_en)
    self.save
  end



  def add_translation(word_en)
    translate_to = self.user.native_language
    # api_to translate word_en
  end

  private

  def card_params
    params.require(:card).permit(:word_id)
  end

end
