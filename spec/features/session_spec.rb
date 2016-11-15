require 'rails_helper'
require 'support/sorcery_login'
RSpec.describe 'Sessions', type: :feature do

  before :each do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

    describe "login test" do
      it "login" do
        visit root_path
        expect(page).to have_content I18n.t('app.account')
      end
  end
end
