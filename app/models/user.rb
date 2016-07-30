require 'bcrypt'

class User

  include DataMapper::Resource
  
  attr_accessor :confirm_password
  attr_reader :password

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  #validates_uniqueness_of :email
  validates_confirmation_of :password_digest, confirm: :confirm_password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
    # return this user
      user
    else
      nil
    end
  end

end
