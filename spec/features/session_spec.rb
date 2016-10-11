require 'rails_helper'
require 'support/sorcery_login'
RSpec.describe 'Sessions', type: :feature do
  describe "login test" do
    before :each do
      @user = Fabricate(:user)
      login_user_post("whatever@whatever.com", "secret")
    end
    it "login" do
      visit root_path
      puts page.body
      expect(page).to have_content "Account"
    end
  end
end