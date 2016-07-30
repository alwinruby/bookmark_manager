feature 'User sign up' do

  scenario  'can sign up as a new user' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, user101@email.com')
      expect(User.first.email).to eq('user101@email.com')
  end

  scenario 'user passwords have to match' do
    expect { sign_up(confirm_password: "1234abcd") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password digest does not match the confirmation'
  end

  scenario 'cannot sign up with no email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'cannot sign up with invalid email' do
    expect { sign_up(email: "wrong@email") }.not_to change(User, :count)
  end

  scenario 'can not sign up with duplicate email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end
