class CardsController < ApplicationController
  before_action :set_current_card, only: [:show, :edit, :update, :destroy]
  before_action :current_user_card
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    if @card.save
      redirect_to cards_path, :notice => t('flash_messages.card.new_card')
    else
      redirect_to new_card_path,:notice => t('flash_messages.card.error_card')
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path, :notice => t('flash_messages.card.update_card')
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, :notice => t('flash_messages.card.del_card')
  end

  private
    def current_user_card
      @cards = current_user.cards
    end
    def set_current_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date, :image, :deck_id)
    end
end
