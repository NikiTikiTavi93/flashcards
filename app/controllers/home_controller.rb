class HomeController < ApplicationController
  def index
    @card = current_user.cards.random_card.first
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:card_id],
                   original_text: params[:original_text])
   redirect_to root_path, notice: checked_card.message
  end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
