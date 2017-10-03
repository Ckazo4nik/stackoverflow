require 'rails_helper'

feature 'autentificate user ', %q{
    I as user have login to app
} do

  given(:user) { create(:user) }
  scenario 'Registered user try sign in' do
    sign_in(user)
    expect(page).to have_content ""
  end
  scenario 'no-registered login to app' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password. Log in Email Password Remember me Sign up Forgot your password'
    expect(current_path).to eq new_user_session_path
  end
end