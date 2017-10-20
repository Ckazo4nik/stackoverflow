FactoryGirl.define do
  factory :oauth_application, class: Doorkeeper::Application do
    name "Test"
    uid '12345678'
    secret '87654321'
  end
end