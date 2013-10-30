class Story < ActiveRecord::Base
  attr_accessible :title, :description, :image_url
  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :image_url
end