class User < ActiveRecord::Base
include Clearance::User

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :stories

  def can_edit(object_with_user_id)
    self.id == object_with_user_id.user_id
  end
end