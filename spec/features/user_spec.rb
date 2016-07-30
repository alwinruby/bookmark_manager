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

end
