class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :owner
  has_and_belongs_to_many :users
  has_many :topics
end
