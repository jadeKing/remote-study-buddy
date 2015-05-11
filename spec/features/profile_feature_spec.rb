require 'rails_helper'

feature 'user profiles' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Username', with: 'MahhIDunno'
    fill_in 'Email', with: 'somebody@someplace.ie'
    fill_in 'Password', with: 'moomoocow'
    fill_in 'Password confirmation', with: 'moomoocow'
    click_button 'Sign up'
  end

  it 'displays username' do
    visit '/'
    click_link 'My Profile'
    expect(page).to have_content 'MahhIDunno'
  end
end
