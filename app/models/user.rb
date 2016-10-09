class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, :password, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end