class CheckCard
  include Interactor
  require 'damerau-levenshtein'

  def call
    context.card = Card.find(context.card_id)
    if context.card.original_text == context.original_text.delete(' ')
      efactor_for_correct
      context.message = 'Card correct'
    elsif mistype?
      efactor_for_mistype
      context.message = "card incorrectly, you made a typing error, the correct answer #{card.original_text}"
    else
      efactor_for_error
      context.message = 'Card incorrect'
    end
  end


  def mistype?
    dl = DamerauLevenshtein.distance("#{context.card.original_text}", " #{context.original_text.delete(' ')}")
    input_word = context.original_text.delete(' ')
    errors_percentage = dl / input_word.length
    if errors_percentage < 0.3
      return true
    else
      return false
    end
  end

  def efactor_for_correct
    context.card.efactor = calculate_efactor(5)
    context.card.review_date = increase_interval
    context.card.counter += 1
    update_card
  end

  def efactor_for_mistype
    context.card.efactor = calculate_efactor(3)
    context.card.review_date = increase_interval
    context.card.counter +=1
    update_card
  end

  def efactor_for_error
    context.card.efactor = 2.5
    context.card.counter = 1
    context.card.review_date = DateTime.now
    update_card
  end

  def calculate_efactor(quality)
    context.card.efactor = (context.card.efactor + (0.1 - (5-quality)*(0.08+(5-quality)*0.02)))
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
