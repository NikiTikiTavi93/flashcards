class Card < ApplicationRecord
  before_validation {original_text.downcase!}
  before_validation {translated_text.downcase!}
  before_create :set_review_date
  validates :original_text, :translated_text, :review_date, presence: true
  validate :original_text_not_equal_translated_text

  def original_text_not_equal_translated_text
    errors.add(:original_text, "Original text not equal translated") if original_text == translated_text
  end

  def set_review_date
    date = 3.days.since
    self.review_date = date
  end
end
