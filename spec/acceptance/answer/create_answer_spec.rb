require 'rails_helper'

feature 'Створення запитання', %q{
  Я, як зареєстрований користувач, можу дати відповідь на запитання
  іншого користувача.
} do
  given(:user) { create(:user) }
  scenario 'Зареєстрований користувач дає відповідь на запитання' do
    sign_in(user)
    question = create(:question)
    visit question_path(question)
    click_on 'add answer'
    fill_in 'Текст відповіді',with: 'ТУт відповідь'
    click_on 'Add answer'
    expect(page).to have_content 'Ваша відповідь була створена'

  end
  scenario 'не зареєстрований користувач дає відповідь на запитання' do
    question = create(:question)
    visit question_path(question)
    click_on 'add answer'
    expect(page).to have_content 'You need to sign in or sign up before continuing. log in sign in sign out Log in Email Password Remember me Sign up Forgot your password?'
  end
  scenario 'Зареєстрований користувач дає не валідну відповідь на запитання' do
    sign_in(user)
    question = create(:question)
    visit question_path(question)
    click_on 'add answer'
    fill_in 'Текст відповіді',with: nil
    click_on 'Add answer'

    expect(page).to have_content 'following fields:Body can\'t be blank'

  end
end