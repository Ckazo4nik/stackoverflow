require 'rails_helper'

feature 'autentificate user ', %q{
    I as user have login to app
} do
  scenario 'Registered user try sign in' do
    User.create(email: "user@test.com", password: "12345678")
    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content "Signed in successfully."
  end
  scenario 'no-registered login to app' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password. Log in Email Password Remember me Sign up Forgot your password'
    expect(current_path).to eq new_user_session_path
  end
end