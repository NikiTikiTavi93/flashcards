class Deck < ApplicationRecord
  belongs_to :users
  has_many :cards
  scope :active_deck, ->{where(active: true).first}
  validates_presence_of :name
end
