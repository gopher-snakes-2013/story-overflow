class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  validates_presence_of :username, :password
  validates_uniqueness_of :username

  has_many :stories

  has_secure_password
end

#in create user form
#password field named password
#another password field password_confirmation

#call .authenticate(<--password) on @user.  return @user if auth, else false

#module logged in helper

