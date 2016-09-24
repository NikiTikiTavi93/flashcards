class Card < ApplicationRecord
  before_save {original_text.downcase!}
  before_save {translated_text.downcase!}
  before_create :review_date
  validates :original_text, :translated_text, :review_date,
            presence: true

  validate :original_text_not_equal_translated_text

  def original_text_not_equal_translated_text
    errors.add(:original_text, "Original text not equal translated") if original_text == translated_text
  end

  def review_date
    date = Date.today + 3
    write_attribute(:review_date, date)
  end
end
