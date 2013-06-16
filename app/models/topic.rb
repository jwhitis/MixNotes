class Topic < ActiveRecord::Base
  attr_accessible :content, :mix_id, :time, :user_id
  belongs_to :mix, :dependent => :destroy
  belongs_to :user
end
