require 'rails_helper'
require 'http_accept_language'
describe UserLocale do
  let(:user) { FactoryGirl.create(:user) }

  it "Check language" do
    user_locale = UserLocale.call(user: user,session: :en,
                                  params: :en, http_accept_language: :http_accept_language)
    expect(I18n.locale).to eq(:en)
  end
  it "user nil" do
    http_accept_language = double()
    allow(http_accept_language).to receive(:compatible_language_from).and_return(:ru)
    user_locale = UserLocale.call(user: nil,session: nil,
                                  params: nil, http_accept_language: http_accept_language)
    expect(I18n.locale).to eq(:ru)
  end
end
