class HomeController < ApplicationController

  def index
    @card = Card.order("RANDOM()").limit(1).first
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:card_id],
                   original_text: params[:original_text])
    if checked_card.success?
      flash[:notice] = "card success"
      redirect_to new_card_path
    else
      flash[:danger] = "Card incorrect"
      redirect_to '/cards'
    end
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
