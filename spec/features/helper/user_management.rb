def user_sign_up(username = 'MahhIDunno',
                 email = 'somebody@someplace.ie',
                 password = 'moomoocow')
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end
