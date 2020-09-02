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
    if card.save!
      redirect_to cards_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    respond_to do |format|
       format.html { redirect_to cards_url notice: 'Card was successfully deleted.' }
   end
    redirect_to cards_path
  end

  def fillout
    word_en = word.en
    self.gif = get_gif(word_en)
    # self.add_translation(word_en)
    save
  end

  def add_translation(_word_en)
    translate_to = user.native_language
    # api_to translate word_en
  end


  private

  def card_params
    params.require(:card).permit(:word_id)
  end
end
