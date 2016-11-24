require 'rails_helper'

describe CheckCard do

  let(:user) { FactoryGirl.create(:user) }
  let(:deck) { FactoryGirl.create(:deck) }
  before do
    @card = FactoryGirl.create(:card, user: user, deck: deck)
  end

  it "call should create card and check equal original text" do
    interactor = CheckCard.call(card_id: @card.id, original_text: @card.original_text)
    expect(interactor).to be_a_success
    expect(interactor.original_text).to eq(@card.original_text)
  end

  it "check for correct" do
    efactor = Card.find(@card.id).efactor
    counter = Card.find(@card.id).counter
    review_date = Card.find(@card.id).review_date
    CheckCard.call(card_id: @card.id, original_text: @card.original_text)
    after_efactor = Card.find(@card.id).efactor
    after_counter = Card.find(@card.id).counter
    after_review_date = Card.find(@card.id).review_date
    efactor = (efactor + (0.1 - (5-5)*(0.08+(5-5)*0.02)))
    expect(efactor).to eq(after_efactor)
    expect(after_counter).to eq(counter+1)
    expect(after_review_date.strftime("%d")).to eq((review_date + 1.day).strftime("%d"))
  end

  it "check for mistype" do
    efactor = Card.find(@card.id).efactor
    counter = Card.find(@card.id).counter
    review_date = Card.find(@card.id).review_date
    CheckCard.call(card_id: @card.id, original_text: 'texd')
    after_efactor = Card.find(@card.id).efactor
    after_counter = Card.find(@card.id).counter
    after_review_date = Card.find(@card.id).review_date
    efactor = (efactor + (0.1 - (5-3)*(0.08+(5-3)*0.02)))
    expect(efactor).to eq(after_efactor)
    expect(after_counter).to eq(counter+1)
    expect(after_review_date.strftime("%d")).to eq((review_date + 1.day).strftime("%d"))
  end
  it "check for error" do
    efactor = Card.find(@card.id).efactor
    counter = Card.find(@card.id).counter
    review_date = Card.find(@card.id).review_date
    CheckCard.call(card_id: @card.id, original_text: 'wrong')
    after_efactor = Card.find(@card.id).efactor
    after_counter = Card.find(@card.id).counter
    after_review_date = Card.find(@card.id).review_date
    expect(efactor).to eq(after_efactor)
    expect(after_counter).to eq(counter)
    expect(after_review_date.strftime("%d")).to eq((review_date).strftime("%d"))
  end
end
