require 'rails_helper'

feature 'добавлення файла до відповіді', %q{
  Можливість додавання файла до своєї відповіді
} do
  given(:user) { create(:user)}
  given(:question) { create(:question)}
    background do
      sign_in(user)
      visit question_path(question)
    end
    scenario 'Валідний користувач додає файл до запитання' do
      fill_in 'You asnwer', with: 'title'
      attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
      click_on 'Create'

      within '.answers' do
        expect(page).to have_link 'spec_helper.rb', href: '/uploads/attachment/file/1/spec_helper.rb'
      end
    end
end