class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
