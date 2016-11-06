require "rails_helper"

RSpec.describe NotificationsMailer, type: :mailer do
  describe "notify" do
    let(:user) {FactoryGirl.create(:user)}
    let(:card) {create(:card, user_id: user.id, deck_id: create(:deck).id, review_date: 1.day.ago)}
    let(:mail) {NotificationsMailer.pending_cards}
    it "test mailer" do
      card
      expect(mail.subject).to eq('There were cards available for testing')
      expect(mail.to).to eq([user.email])
    end
  end
end
