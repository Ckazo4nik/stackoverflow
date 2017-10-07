require 'rails_helper'


feature 'Створення відповіді на запитання', %q{
  Я, як залогінений користувач
  можу давати відповіді іншим користувачам
} do
  given(:user) { create(:user)}
  given(:question) { create(:question)}

    scenario 'Створення відповіді' do
      sign_in(user)
      visit question_path(question)
      fill_in 'You answer', with: 'Answer'
      click_on 'Create'
      expect(current_path).to eq question_path(question)

      within '.answers' do
        expect(page).to have_content 'Answer'
      end
    end
 end
