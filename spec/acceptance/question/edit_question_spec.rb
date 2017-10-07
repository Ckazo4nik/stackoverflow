require 'rails_helper'

feature 'autentificate user can edit question', %q{
  I as autentificate user want edit my question
} do
  given(:user) { create(:user) }

  scenario 'Autentificate user edit question' do
    sign_in(user)
    question = create(:question)
    visit root_path
    click_on 'Edit question'
    fill_in 'Title', with: 'Orest228'
    fill_in 'Body', with: 'Tester'
    click_on 'Update'
    question.reload
    expect(question.title).to eq 'Orest228'
    expect(question.body).to eq 'Tester'
  end

  scenario 'no-autentificate user edit question' do
    question = create(:question)
    visit root_path
    click_on 'Edit question'
    expect(page).to have_content 'You need to sign in or sign up before continuing. log in sign in sign out Log in Email Password Remember me Sign up Forgot your password?'
  end

  scenario 'miss atributs' do
    sign_in(user)
    question = create(:question)
    visit root_path
    click_on 'Edit question'
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Tester'
    click_on 'Update'

    expect(page).to have_content '1 error prohibited this question from being saved'
  end
end