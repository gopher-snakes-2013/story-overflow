class Story < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :user_id
  validates_presence_of :title, :description, :image_url, :user_id
  validates_uniqueness_of :image_url

  belongs_to :user
  has_many :comments
end