class User < ApplicationRecord

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :cards

  before_save { email.downcase! }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: VALID_EMAIL }
  validates :password, confirmation: true
  validates :password, length: { minimum:6 }
  validates :password_confirmation, presence: true
end
