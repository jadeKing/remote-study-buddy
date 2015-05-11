require 'rails_helper'

feature 'User management system' do
  context 'user is not signed in' do
    it 'should see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
  end
end