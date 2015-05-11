require 'rails_helper'
require_relative 'helper/user_management'

feature 'User management system' do
  context 'user is not signed in' do
    it 'sees sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'user can sign in' do
      user_sign_up
      click_link 'Logout'
      click_link 'Sign in'
      fill_in 'Email', with: 'somebody@someplace.ie'
      fill_in 'Password', with: 'moomoocow'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end

  context 'user is signed in' do
    before do
      user_sign_up
    end

    scenario 'user logs out' do
      click_link 'Logout'
      expect(page).to have_content 'Signed out successfully'
      expect(page).not_to have_link 'Logout'
    end
  end
end
