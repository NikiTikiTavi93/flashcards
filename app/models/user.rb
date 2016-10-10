class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :cards
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end