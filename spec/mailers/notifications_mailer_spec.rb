require "rails_helper"

RSpec.describe NotificationsMailer, type: :mailer do
  describe "notify" do
    let(:mail) {NotificationsMailer.pending_cards}
    let(:user) {FactoryGirl.create(:user)}
    let(:deck) {FactoryGirl.create(:deck)}
    let(:card) {FactoryGirl.create(:card, deck_id: deck.id)}
    it "test mailer" do
      puts card
      expect(mail.subject).to eq('There were cards available for testing')
    end
  end
end
