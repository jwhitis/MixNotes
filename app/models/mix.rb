class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :admin
  has_and_belongs_to_many :users
  has_many :comments
end
