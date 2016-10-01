class HomeController < ApplicationController

  def index
    @card = Card.random_card.first
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:card_id],
                   original_text: params[:original_text])
    if checked_card.success?
      redirect_to root_path, notice: checked_card.correct_message
    else
      redirect_to root_path, notice:checked_card.incorrect_message
    end
  end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
