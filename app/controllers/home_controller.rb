class HomeController < ApplicationController
  def index
    @card = GetRandomCard.call(user: current_user).card
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
      params.require(:card).permit(:original_text, :translated_text, :review_date, :image)
    end

    def deck_params
      params.require(:deck).permit(:user_id, :name, :active)
    end
end
