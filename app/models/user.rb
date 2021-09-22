class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    user = find_by_email(email)
    puts "user = #{user}"
    if user && user.authenticate(password)
      user
    else
      puts "nothing"
      nil
    end
  end
end
