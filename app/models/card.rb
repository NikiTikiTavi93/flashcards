class Card < ApplicationRecord
  before_save {original_text.downcase!}
  before_save {translated_text.downcase!}
  before_save :review_date
  validates :original_text, :translated_text, :review_date, presence: true

  def review_date
    date = Date.today + 3
    write_attribute(:review_date, date)
  end
end
