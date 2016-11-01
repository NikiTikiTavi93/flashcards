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

  it "check how work count_checks " do
    count = 0
    while count != 5
      card_checks = Card.find(@card.id).count_checks
      CheckCard.call(card_id: @card.id, original_text: @card.original_text)
      card_checks_after = Card.find(@card.id).count_checks
        if card_checks == 5
          expect(card_checks_after).to eq(card_checks)
        else
          expect(card_checks_after).to eq(card_checks+1)
        end
      count += 1
    end
  end

  it "check how work count_errors" do
    count = 0
    while count !=3
      card_errors = Card.find(@card.id).count_errors
      CheckCard.call(card_id: @card.id, original_text: 'wrong text')
      card_errors_after = Card.find(@card.id).count_errors
      if card_errors_after.zero?
        expect(card_errors).to eq(2)
      else
        expect(card_errors_after).to eq(card_errors+1)
      end
      count += 1
    end
  end

  it "reset count_checks" do
    count_checks = 0
    while count_checks != 4
      card_checks = Card.find(@card.id).count_checks
      CheckCard.call(card_id: @card.id, original_text: @card.original_text)
      card_checks_after = Card.find(@card.id).count_checks
      expect(card_checks_after).to eq(card_checks+1)
      count_checks += 1
    end
    count_errors = 0
    while count_errors != 3
      CheckCard.call(card_id: @card.id, original_text: 'wrong text')
      card_errors_after = Card.find(@card.id).count_errors
      card_checks_after_error = Card.find(@card.id).count_checks
      if card_errors_after.zero?
        expect(card_checks_after_error).to eq(0)
      end
      count_errors += 1
    end
  end
end
