require 'rails_helper'
require 'support/login_helper'

RSpec.describe 'Sessions', type: :feature do
  describe "login test" do
    let(:user) { FactoryGirl.create(:user, email: "user@mail.ru", password: "qwe") }
    before do
      login("user@mail.ru", "qwe")
    end
    it "login" do
      visit root_path
      expect(page).to have_content "Account"
  end

  end

end