class CardsController < ApplicationController

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      redirect_to new_card_path
    end
  end

  def index
    @cards = Card.all
  end

  def show
    @card = current_card
  end

  def edit
    @card = current_card
  end

  def update
    @card = current_card
    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @card = current_card
    @card.destroy
    redirect_to cards_path
  end

  private
    def current_card
      Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
