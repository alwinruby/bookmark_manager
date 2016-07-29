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
    #expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

end

feature 'User sign in' do

  describe User do

    let!(:user) do
      User.create(email: 'test1@email.com',
                  password: 'hello12345',
                  confirm_password: 'hello12345')
      end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password_digest)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  scenario 'user correctly signs in' do
    sign_in(email: user.email, password: user.password_digest)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end

end
