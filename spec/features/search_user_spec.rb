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
  end
end
