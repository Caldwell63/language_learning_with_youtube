class WordsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    if user.present?
      words = Word.available_for(user)
    else
      words = Word.all
    end

    words = words.where('en ilike ?', "#{params[:search]}%")

    render json: words.order(:en).limit(10)
  end
end
