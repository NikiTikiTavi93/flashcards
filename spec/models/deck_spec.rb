require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:deck) {FactoryGirl.create(:deck)}
  describe 'validations' do
    it 'presence' do
      expect(deck.valid?)
    end
    it 'nil' do
      deck = Deck.new(name:nil, active: nil)
      expect(deck.valid?).to be_falsey
    end
    it 'name nil'do
      deck = Deck.new(name:nil, active:true)
      expect(deck.valid?).to be_falsey
    end
    it 'active  nil' do
      deck = Deck.new(name:'asdf', active: false)
      expect(deck.active).to eq(false)
    end
  end

end
