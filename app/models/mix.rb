class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :admin
  has_many :permissions
  has_many :users, :through => :permissions
  has_many :comments
end
