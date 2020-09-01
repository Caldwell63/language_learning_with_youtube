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


    fillout


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
    translate_to = self.user.#motherlanguage
    # api_to translate word_en

  # private

  def card_params
    params.require(:card).permit(:stage, :known_on)

  end
end
