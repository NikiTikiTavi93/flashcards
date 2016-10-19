class Card < ApplicationRecord
  belongs_to :user
  before_validation {original_text.downcase!}
  before_validation {translated_text.downcase!}
  before_create :set_review_date
  validates :original_text, :translated_text, presence: true
  validate :original_text_not_equal_translated_text
  scope :random_card, ->{ where("review_date <= ?", DateTime.now ).order("RANDOM()").limit(1) }
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials},
                    styles: {medium: "360x360"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def original_text_not_equal_translated_text
    errors.add(:original_text, "Original text not equal translated") if original_text == translated_text
  end

  def set_review_date
    date = 3.days.from_now
    self.review_date = date
  end
  def s3_credentials
    { :bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
end
