class User < ActiveRecord::Base
include Clearance::User

  attr_accessible :username, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :stories
end