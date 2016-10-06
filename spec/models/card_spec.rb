require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  describe 'validations' do
    it 'not blank' do
      card = Card.new(original_text: '',translated_text: '',review_date: DateTime.now)
      expect(card.valid?)
    end

    it 'not equal' do
      card = Card.new(original_text: 'text', translated_text: 'text', review_date: DateTime.now)
      expect(card.valid?).to be_falsey
    end

    it 'review_date' do
      card = Card.create!(original_text: 'as',translated_text: 'da', user: user)
      expect(card.review_date.strftime("%d")).to eq((Time.zone.now + 3.days).strftime("%d"))
    end
  end
end
