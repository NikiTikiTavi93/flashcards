class Deck < ApplicationRecord
  belongs_to :users
  has_many :cards
  scope :active_deck, ->{where(active: true).first}

  def set_active_deck

  end
end
