require 'rails_helper'

feature 'добавлення файла до запитання', %q{
  Можливість додавання файла до свого запитання
} do
  given(:user) { create(:user)}
  scenario 'Не зареєстрований користувач додає файлм' do
    visit questions_path
    click_on 'Ask question'
    expect(page).to have_content 'log'
  end
  describe 'Зареєстрований користувач' do
    background do
      sign_in(user)
      visit questions_path
      click_on 'Ask question'
    end
    scenario 'Валідний користувач додає файл до запитання' do
      fill_in 'Title', with: 'title'
      fill_in 'Body', with: 'body'
      attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
      click_on 'Create'

      expect(page).to have_content 'spec_helper.rb'
    end
    scenario 'Не зареєстрований користувач додає файлм'
    scenario 'Не зареєстрований користувач додає файлм'
    scenario 'Не зареєстрований користувач додає файлм'

  end
end