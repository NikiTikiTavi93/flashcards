class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.original_text
      card.review_date = DateTime.now + 3.day
      card.save
    else
      context.fail!
    end
  end
end
