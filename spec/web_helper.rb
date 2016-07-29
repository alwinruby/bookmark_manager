require 'spec_helper'

def sign_up(email: 'user101@email.com', password: 'P@ssw0rd123?', confirm_password: 'P@ssw0rd123?')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :confirm_password, with: confirm_password
  click_button 'Sign up'
end
