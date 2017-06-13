class GetRandomCard
  include Interactor

  def call
    user = context.user
    if user.decks.find_by(active: true)
      context.card = user.decks.active_deck.cards.random_card.first
    else
      context.card = Card.random_card.first
    end
  end
end
