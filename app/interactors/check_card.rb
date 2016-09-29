class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.original_text
      context.original_text == card.original_text
    else
      context.fail!
    end
  end
end
