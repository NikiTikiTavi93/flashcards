class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.original_text.gsub(/ /, '')
      correct_answer(card)
      context.message = 'Card correct'
    else
      incorrect_answer(card)
      context.message = 'Card incorrect'
    end
  end

  def correct_answer(card)
    card.increment(:count_checks)
    case card.count_checks
      when 1
        card.update(review_date: 12.hours.since)
      when 2
        card.update(review_date: 3.days.since)
      when 3
        card.update(review_date: 1.weeks.since)
      when 4
        card.update(review_date: 2.weeks.since)
      when 5
        card.update(review_date: 1.months.since)
    end
  end
  def incorrect_answer(card)
    card.increment(:count_errors)
    card.save
    if card.count_errors == 3
        card.update(count_checks: 0, review_date: DateTime.now, count_errors: 0)
    end
  end
end
