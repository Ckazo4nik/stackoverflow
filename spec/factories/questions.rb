FactoryGirl.define do
  factory :question do
    title "MyString"
    body "MyText"
    association :user, factory: :user

  end
  factory :invalid_question, class: "Question" do
    title nil
    body nil
    user
  end
end
