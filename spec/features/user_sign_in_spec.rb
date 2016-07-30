feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user1@email.com',
        password: 'hello12345',
        confirm_password: 'hello12345')
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
