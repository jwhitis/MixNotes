class Reply < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id
  belongs_to :topic, :dependent => :destroy
  belongs_to :user
end
