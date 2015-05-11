require 'rails_helper'

feature 'User management system' do
  context 'user is not signed in' do
    it 'should see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
  end

  context 'user is signed in' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'somebody@someplace.ie'
      fill_in 'Password', with: 'moomoocow'
      fill_in 'Password confirmation', with: 'moomoocow'
      click_button 'Sign up'
    end

    scenario 'user logs out' do
      click_link 'Logout'
      expect(page).to have_content 'Signed out successfully'
      expect(page).not_to have_link 'Logout'
    end
  end
end
