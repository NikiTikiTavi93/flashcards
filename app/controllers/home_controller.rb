class HomeController < ApplicationController
  def index
    result = GetRandomCard.call(user: current_user)
    @card = result.card
    if @card
      gon.card_id = @card.id
    else
      gon.card_id = 0
    end
    respond_to do |format|
      format.html
      format.json { render json: { card: @card }}
    end
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:id_card],
                   original_text: params[:check_text],
                   timer: params[:timer])
   @notice = checked_card.message
   nominate = GetRandomCard.call(user: current_user)

   @card =nominate.card

    respond_to do |format|
      format.html
      format.json { render json: { notice: @notice }}
    end
   # if checked_card.message == checked_card.done
   #   redirect_to root_path, :notice => checked_card.done
   # elsif checked_card.message == checked_card.mistype
   #   flash[:notice]=checked_card.message
   #   redirect_to root_path, :notice => checked_card.mistype
   # elsif checked_card.message = checked_card.alert
   #   flash[:alert]=checked_card.alert
   #   redirect_to root_path, :alert => checked_card.alert
   end


  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date, :image,:timer)
    end

    def deck_params
      params.require(:deck).permit(:user_id, :name, :active)
    end
end
