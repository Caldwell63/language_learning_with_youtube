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
  end
end
