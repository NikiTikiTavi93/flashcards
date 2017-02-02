class HomeController < ApplicationController
  def index
    @card = GetRandomCard.call(user: current_user).card
  end

  def show
  end

  def check
   checked_card = CheckCard.call(card_id: params[:card][:id],
                   original_text: params[:card][:original_text],
                   timer: params[:card][:timer])
   nominate = GetRandomCard.call(user: current_user)
   if checked_card.message == checked_card.done
       flash[:notice] =  checked_card.done
   elsif checked_card.message == checked_card.mistype
       flash[:notice]=checked_card.mistype
   elsif checked_card.message = checked_card.alert
       flash[:alert]=checked_card.alert
   end
   @card =nominate.card
    respond_to do |format|
      format.js
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
