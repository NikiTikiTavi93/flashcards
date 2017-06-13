class CheckCard
  include Interactor
  require 'damerau-levenshtein'

  def call
    timer = context.timer.to_i

    context.card = Card.find(context.card_id)
    if context.card.original_text.strip == context.original_text.strip
      efactor_for_correct(context.card)
      timing(timer)
      context.done = I18n.t('flash_messages.card.correct_card') + context.message
      context.message = context.done
    elsif mistype?
      efactor_for_mistype(context.card)
      timing(timer)
      context.mistype = "#{I18n.t('flash_messages.card.mistype_card')} #{context.card.original_text}"
      + context.message
      context.message = context.mistype
    else
      efactor_for_error(context.card)
      context.alert = I18n.t('flash_messages.card.error_card')
      context.message = context.alert
    end
  end

  def timing(timer)
    if timer > 10
      context.message = "Очень долго"
    elsif (timer > 5) || (timer >= 10)
      context.message = "Неплохо!"
    else
      context.message = "Великолепно"
    end
  end

  def mistype?
    dl = DamerauLevenshtein.distance("#{context.card.original_text}", " #{context.original_text.delete(' ')}")
    input_word = context.original_text.delete(' ')
    if input_word.blank?
      return false
    else
      errors_percentage = dl / input_word.length
      if errors_percentage < 0.3
        return true
      else
        return false
      end
    end
  end

  def efactor_for_correct(card)
    card.efactor = calculate_efactor(5)
    card.review_date = increase_interval
    card.counter += 1
    update_card
  end

  def efactor_for_mistype(card)
    card.efactor = calculate_efactor(3)
    card.review_date = increase_interval
    card.counter +=1
    update_card
  end

  def efactor_for_error(card)
    card.efactor = 2.5
    card.counter = 1
    card.review_date = DateTime.now
    update_card
  end

  def calculate_efactor(quality)
    context.card.efactor = (context.card.efactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02)))
  end

  def increase_interval
    context.card.review_date = DateTime.now +
      case context.card.counter
        when 1
          1.day
        when 2
          6.days
        else
          (( context.card.counter - 1) * context.card.efactor ).round.days
      end
  end

  def update_card
    context.card.update(review_date: context.card.review_date, efactor: context.card.efactor, counter: context.card.counter)

  end
end
