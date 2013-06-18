class Reply < ActiveRecord::Base
  attr_accessible :content, :comment_id, :user_id
  belongs_to :comment, :dependent => :destroy
  belongs_to :user
end
