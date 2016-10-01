class HomeController < ApplicationController

  def index
    @card = Card.random_card.first
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:card_id],
                   original_text: params[:original_text],
                   review_date: params[:review_date])
    if checked_card.success?
      flash[:info] = "Card correct"
    else
      flash[:info] = "Card incorrect"
    end
   redirect_to root_path
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
