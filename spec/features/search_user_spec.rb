require 'rails_helper'
require_relative 'helper/user_management'

feature 'list of languages' do
  context 'with languages in the database' do
    before do
      language_names = %w(Ruby FORTRAN Lisp BASIC)
      language_names.each do |name|
        Language.create name: name
      end
    end

    scenario 'sees a list of programming languages' do
      visit '/'
      expect(page).to have_link 'Ruby'
      expect(page).to have_link 'FORTRAN'
      expect(page).to have_link 'Lisp'
      expect(page).to have_link 'BASIC'
    end
  end

  context 'without languages in the database' do
    scenario 'add a language to the list' do
      visit '/languages/new'
      fill_in 'Name', with: 'Ruby'
      click_button 'Add'
      expect(page).to have_link 'Ruby'
    end
  end

  context 'groups users by language' do
    before do
      user_sign_up
      Language.create(name: 'Ruby')
      visit '/'
      click_link 'My Profile'
      click_link 'Add Language'
      click_button 'Add Ruby'
    end

    scenario 'show users learning a particular language and link to their profiles' do
      visit '/'
      click_link 'Ruby'
      expect(page).to have_link 'MahhIDunno'
      click_link 'MahhIDunno'
      expect(page).to have_content 'somebody@someplace.ie'
    end

    context 'filter by skill level' do
      before do
        user = User.create(username: 'tester',
                           email: 'test@test.com',
                           password: 'testtest',
                           password_confirmation: 'testtest')

        user2 = User.create(username: 'Mike',
                            email: 'test2@test.com',
                            password: 'testtest',
                            password_confirmation: 'testtest')

        user3 = User.create(username: 'Paul',
                            email: 'test3@test.com',
                            password: 'testtest',
                            password_confirmation: 'testtest')

        ruby = Language.where(name: 'Ruby').first
        user.user_languages.create(language: ruby, skill_level: 'beginner')
        user2.user_languages.create(language: ruby, skill_level: 'intermediate')
        user3.user_languages.create(language: ruby, skill_level: 'expert')
      end

      scenario 'default shows all skill levels' do
        visit '/'
        click_link 'Ruby'
        expect(page).to have_content 'tester'
        expect(page).to have_content 'Mike'
        expect(page).to have_content 'Paul'
      end

      scenario 'display only beginners' do
        visit '/'
        click_link 'Ruby'
        click_link 'Beginners'
        expect(page).to have_content 'tester'
        expect(page).not_to have_content 'Mike'
        expect(page).not_to have_content 'Paul'
      end

      scenario 'display only intermediat' do
        visit '/'
        click_link 'Ruby'
        click_link 'Intermediates'
        expect(page).not_to have_content 'tester'
        expect(page).to have_content 'Mike'
        expect(page).not_to have_content 'Paul'
      end

      scenario 'display only expert' do
        visit '/'
        click_link 'Ruby'
        click_link 'Expert'
        expect(page).not_to have_content 'tester'
        expect(page).not_to have_content 'Mike'
        expect(page).to have_content 'Paul'
      end
    end
  end
end
