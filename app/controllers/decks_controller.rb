class DecksController < ApplicationController
  before_action :set_current_deck, only: [:show, :edit, :update, :destroy]
  before_action :current_user_decks

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
    check_active_deck
    if @deck.save
      redirect_to decks_path, :notice => t('flash_messages.deck.new_deck')
    else
      render :new
    end
  end

  def edit
  end

  def update
    check_active_deck
    if @deck.update(deck_params)

      redirect_to decks_path, :notice => t('flash_messages.deck.update_deck')
    else
      render 'edit'
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path, :notice => t('flash_messages.deck.del_deck')
  end


  private
    def check_active_deck
      if @deck.active == true
        @decks.update_all(active: false)
      end
    end

    def current_user_decks
      @decks = current_user.decks
    end

    def set_current_deck
      @deck = Deck.find(params[:id])
    end

    def deck_params
      params.require(:deck).permit(:name, :active)
    end
end
