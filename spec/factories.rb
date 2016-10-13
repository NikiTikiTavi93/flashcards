FactoryGirl.define do
  factory :authentication do

  end
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "qwerty"
    password_confirmation { password }
  end
  factory :card do
    original_text "text"
    translated_text "trans_text"
    review_date {5.days.ago}
  end
end
