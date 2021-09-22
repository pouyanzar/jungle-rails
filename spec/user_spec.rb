require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    it 'should ask for longer password' do 
      @user = User.new(:first_name => 'firstName', :last_name => 'lastName',:email => 'test@test.com', :password => 'passwor', :password_confirmation => 'passwor')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should ask to enter the same password for both password field' do
      @user = User.new(:first_name => 'firstName', :last_name => 'lastName',:email => 'test@test.com', :password => 'password', :password_confirmation => 'passwor')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should ask to enter the password' do
      @user = User.new(:first_name => 'firstName', :last_name => 'lastName',:email => 'test@test.com', :password_confirmation => 'passwor')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should ask to fill password_confirmation field' do
      @user = User.new(:first_name => 'firstName', :last_name => 'lastName',:email => 'test@test.com', :password => 'password')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should say email aleady exists' do
      @user1 = User.new(:first_name => 'firstName', :last_name => 'lastName', :email => 'test@test.COM', :password => 'password', :password_confirmation => 'password')
      @user1.save
      @user2 = User.new(:first_name => 'firstName', :last_name => 'lastName', :email => 'TEST@TEST.com', :password => 'password', :password_confirmation => 'password')
      @user2.save
      puts @user2.errors.full_messages
      expect(@user2).to_not be_valid;
    end
    it 'should say first_name is nil' do
      @user = User.new(:last_name => 'lastName', :email => 'test@test.com', :password => 'password',:password_confirmation => 'password')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should say last_name is nil' do
      @user = User.new(:first_name => 'firstName', :email => 'test@test.com', :password => 'password',:password_confirmation => 'password')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to_not be_valid;
    end
    it 'should save the user successfully' do
      @user = User.new(:first_name => 'firstName', :last_name => 'lastName', :email => 'test@test.com', :password => 'password',:password_confirmation => 'password')
      @user.save
      puts @user.errors.full_messages
      expect(@user).to be_valid;
    end
  end
  describe '.authenticate_with_credentials' do
    
    it 'should return the user' do 
      @user1 = User.new(:first_name => 'firstName', :last_name => 'lastName', :email => 'test@test.com', :password => 'password',:password_confirmation => 'password')
      @user1.save
      expect(User.authenticate_with_credentials("TEST@TEST.COM", "password")).to_not be_nil
    end
  end
end