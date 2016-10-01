class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.original_text.gsub(/ /, '')
      card.review_date = DateTime.now + 3.days
      card.save
      context.correct_message = 'Card correct'
    else
      context.incorrect_message = 'Card incorrect'
      context.fail!
    end
  end
end
