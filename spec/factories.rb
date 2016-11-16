FactoryGirl.define do
  factory :deck do
    name "deck"
    active true
  end
  factory :authentication do

  end
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "qwerty"
    password_confirmation { password }
    locale "en"
  end
  factory :card do
    original_text "text"
    translated_text "trans_text"
    review_date {DateTime.now}
  end
end
