require 'rails_helper'

feature 'user searches for other users' do
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
end
