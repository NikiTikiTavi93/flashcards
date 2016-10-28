class Card < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  before_validation {original_text.downcase!}
  before_validation {translated_text.downcase!}
  before_create :set_review_date
  validates :original_text, :translated_text, presence: true
  validate :original_text_not_equal_translated_text
  validates_presence_of :deck_id
  scope :random_card, ->{ where("review_date <= ?", DateTime.now ).order("RANDOM()").limit(1) }
  has_attached_file :image,
                    styles: {medium: "360x360"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def original_text_not_equal_translated_text
    errors.add(:original_text, "Original text not equal translated") if original_text == translated_text
  end

  def set_review_date
    date = 3.days.from_now
    self.review_date = date
  end
end
