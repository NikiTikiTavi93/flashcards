class DecksController < ApplicationController

  before_action :set_current_deck, only: [:show, :edit, :update, :destroy]
  before_action :current_user_deck

  def index
  end

  def show
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user_id = current_user.id
    if @deck.save
      if @deck.active == true
        @decks.update_all(active: false)
        @deck.update(active: true)
      end

      redirect_to decks_path, :notice => "New deck added"
    else
      redirect_to new_deck_path, :notice =>"New deck doesn't create"
    end
  end

  def edit
  end

  def update
    if @deck.update(deck_params)
      redirect_to decks_path
    else
      render 'edit'
    end
    end

  def destroy
    @deck.destroy
    redirect_to decks_path
  end


  private

    def current_user_deck
      @decks = current_user.decks
    end

    def set_current_deck
      @deck = Deck.find(params[:id])
    end

    def deck_params
      params.require(:deck).permit(:name, :active)
    end
end
