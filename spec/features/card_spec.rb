require 'rails_helper'

RSpec.describe 'home', type: :feature do
  let(:card) { FactoryGirl.create(:card)}
  before do
    card.review_date = 10.days.ago
    card.save
  end
  it "have text" do
    visit root_path
    fill_in :original_text, with: card.original_text
    click_button "Проверить"
    expect(page).to have_content "Card correct"
  end
end
