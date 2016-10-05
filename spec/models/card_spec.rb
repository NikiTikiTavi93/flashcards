require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validations' do
    it 'not blank' do
      card = Card.new(original_text: '',translated_text: '',review_date: DateTime.now)
      expect(card.valid?)
    end

    it 'not equal' do
      card = Card.new(original_text: 'text', translated_text: 'text', review_date: DateTime.now)
      expect(card.valid?).to be_falsey
    end

    it "review_date" do
      card = Card.new(original_text: '',translated_text: '',review_date: Time.zone.now)
      card.set_review_date
      card.save
      expect(card.review_date == Time.zone.now + 3.days)
    end
  end
end
