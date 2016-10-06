FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"
  end
  factory :card do
    original_text "text"
    translated_text "trans_text"
    review_date {5.days.ago}
  end
end
