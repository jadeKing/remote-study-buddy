require 'rails_helper'
require_relative 'helper/user_management'

feature 'user profiles' do
  before do
    user_sign_up
  end

  it 'displays username' do
    visit '/'
    click_link 'My Profile'
    expect(page).to have_content 'MahhIDunno'
  end

  it 'displays a users chosen languages' do
    Language.create(name: 'Ruby')
    Language.create(name: 'Java')
    visit '/'
    click_link 'My Profile'
    click_link 'Add Language'
    click_button 'Add Ruby'
    click_link 'My Profile'
    click_link 'Add Language'
    click_button 'Add Java'
    click_link 'My Profile'
    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Java'
  end

  it 'displays user skill level for the given language' do
    Language.create(name: 'Ruby')
    visit '/'
    click_link 'My Profile'
    click_link 'Add Language'
    choose 'skill_level_intermediate'
    click_button 'Add Ruby'
    click_link 'My Profile'
    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Intermediate'
  end

  it 'only displays add language on current user profile' do
    user = User.all.first.id
    click_link 'Logout'
    visit "/users/#{user}"
    expect(page).not_to have_link 'Add Language'
    user_sign_up('joe', 'test3@test.com')
    visit "/users/#{user}"
    expect(page).not_to have_link 'Add Language'
  end

  it 'does not show users email address to logged out users' do
    user = User.all.first.id
    click_link 'Logout'
    visit "/users/#{user}"
    expect(page).not_to have_content 'contact: somebody@someplace.ie'
  end

  it 'displays users email to all logged in users' do
    click_link 'My Profile'
    expect(page).to have_content 'contact: somebody@someplace.ie'
  end











end
