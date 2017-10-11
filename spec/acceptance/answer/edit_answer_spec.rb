require 'rails_helper'

feature 'Користувач може редагувати свої відповіді', %q{
  Я як зареєстрований користувач можу
  редагувати лише свої відповіді
} do
  given(:user) { create(:user)}
  given!(:question) { create(:question)}
  scenario 'не залогінений користувач пробує редагувати' do
    visit question_path(question)
    expect(page).to have_content 'log in sign in sign out'
  end
  describe 'Valid User' do
    before do
      sign_in(user)
      visit question_path(question)

    end
    scenario 'Є силка редагувати' do
      within  '.answers' do
        expect(page).to have_link 'Edit'
      end
    end
    scenario 'Валідний користувач редагує свою відповідь' do
      fill_in 'You answer', with: 'Answer'
      click_on 'Create'
      expect(current_path).to eq question_path(question)

      within '.answers' do
        expect(page).to have_content 'Answer'
      end


      within '.answers' do
        click_on 'Edit'
        fill_in 'Answer', with: 'rename answer'
        click_on 'Save'
        expect(page).to_not have_content answer.body
        expect(page).to have_content 'rename answer'
        expect(page).to_not have_selector 'textarea'
        save_and_open_page
      end

    end
    scenario 'Валідний користувач редагує свою відповідь'
    scenario 'Валідний користувач редагує свою відповідь'

  end
end