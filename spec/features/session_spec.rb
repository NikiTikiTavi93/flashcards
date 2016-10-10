require 'rails_helper'
require 'support/login_helper'

RSpec.describe 'Sessions', type: :feature do
  describe "login test" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user.email, @user.password)
    end
    it "login" do
      visit root_path
      puts page.body
      expect(page).to have_content "Account"
  end

  end

end