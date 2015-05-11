require 'rails_helper'

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
    scenario 'show users learning a particular language' do
      visit '/languages'
      click_link 'Ruby'
      expect(page).to have_content 'test@test.com'
    end
  end
end
