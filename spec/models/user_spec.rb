require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = User.new(email: "user@example.ru", password: "password", password_confirmation: "password")
    end

    subject { @user }

    it { should be_valid(:email) }
    it { should be_valid(:password) }

    describe "email presence test" do
      before { @user.email = '' }
      it { should_not be_valid }
    end

    describe "email valid test" do
      before { @user.email = 'user' }
      it { should_not be_valid }
    end

    describe "password presence test" do
      before { @user.password = '' }
      it { should_not be_valid }
    end
    describe "password length" do
      before { @user.password = 'a'*5 }
      it { should_not be_valid }
    end
  end
end
