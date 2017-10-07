FactoryGirl.define do

  factory :invalid_answer, class: "Answer" do
    title nil
    body nil
  end
  factory :answer do
    association :question, factory: :question
    association :user, factory: :user
    body "MyText"
  end
end
