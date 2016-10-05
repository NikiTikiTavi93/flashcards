FactoryGirl.define do
  factory :card do
    original_text "text"
    translated_text "trans_text"
    review_date {5.days.ago}
  end
end
