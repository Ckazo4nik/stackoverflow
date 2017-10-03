require 'rails_helper'

feature 'Create question', %q{
  I as login user want to create question
} do
  given(:user) { create(:user) }
  scenario 'Autentificate user create question' do
    User.create(email: "user@test.com", password: "12345678")

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    visit questions_path
    click_on "Ask question"
    fill_in "Title", with: "qweqwe"
    fill_in "Body", with: "1qqweqqwe"
    click_on "Create"
    expect(page).to have_content "Question was created."
  end
  scenario 'no-autentificate user create question' do
    visit questions_path
    click_on "Ask question"

    expect(page).to have_content "You need to sign in or sign up before continuing. Log in Email Password Remember me Sign up Forgot your password?"
  end
end