class Comment < ActiveRecord::Base
  attr_accessible :comment_text, :user, :story
  validates_presence_of :comment_text

  belongs_to :user
  belongs_to :story
end