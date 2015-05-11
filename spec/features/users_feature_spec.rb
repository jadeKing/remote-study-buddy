require 'rails_helper'

feature 'User management system' do
  context 'user is not signed in' do
    it 'should see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'user can sign in' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Username', with: 'MahhIDunno'
      fill_in 'Email', with: 'somebody@someplace.ie'
      fill_in 'Password', with: 'moomoocow'
      fill_in 'Password confirmation', with: 'moomoocow'
      click_button 'Sign up'
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
      visit '/'
      click_link 'Sign up'
      fill_in 'Username', with: 'MahhIDunno'
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
