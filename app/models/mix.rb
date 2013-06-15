class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :user_id
  belongs_to :user
end
