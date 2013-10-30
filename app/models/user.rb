class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :stories
end