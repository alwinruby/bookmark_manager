require 'bcrypt'

class User

  attr_accessor :confirm_password

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, String, length: 60

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password_digest, confirm: :confirm_password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
