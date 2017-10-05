FactoryGirl.define do


  factory :answer do
    association :question, factory: :question
    association :user, factory: :user
    body "MyText"
  end
end
