require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:deck) {FactoryGirl.create(:deck)}
  describe 'validations' do
    it 'not blank' do
      card = Card.new(original_text: '',translated_text: '',review_date: DateTime.now, deck_id: deck.id)
      expect(card.valid?)
    end

    it 'not equal' do
      card = Card.new(original_text: 'text', translated_text: 'text', review_date: DateTime.now, deck_id: deck.id)
      expect(card.valid?).to be_falsey
    end

    it 'review_date' do
      card = Card.create!(original_text: 'as',translated_text: 'da', user: user, deck_id: deck.id)
      expect(card.review_date.strftime("%d")).to eq((Time.zone.now).strftime("%d"))
    end
    it 'have deck' do
      card = Card.new(original_text: 'text', translated_text: 'text', review_date: DateTime.now, deck_id: nil)
      expect(card.valid?).to be_falsey
    end
  end
end
