class CheckCard
  include Interactor

  def call
    attempt = 0
    card = Card.find(context.card_id)
    if card.original_text == context.original_text.gsub(/ /, '')
      check_card(card)
      context.message = 'Card correct'
    else
      errors_card(card)
      context.message = 'Card incorrect'
      context.fail!
    end
  end

  def check_card(card)
      card.increment(:count_checks)
      card.save
      case
        when card.count_checks == 1
          card.update(review_date: 12.hours.since)
        when card.count_checks == 2
          card.update(review_date: 3.days.since)
        when card.count_checks == 3
          card.update(review_date: 1.weeks.since)
        when card.count_checks == 4
          card.update(review_date: 2.weeks.since)
        when card.count_checks == 5
          card.update(review_date: 1.months.since)
      end
  end
  def errors_card(card)
    card.increment(:count_errors)
    card.save
    if card.count_errors == 3
      card.update(count_checks: 0)
      card.update(review_date: DateTime.now)
      card.update(count_errors: 0)
    end
  end
end
