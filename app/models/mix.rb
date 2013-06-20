class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :admin
  has_many :permissions
  has_many :users, :through => :permissions
  has_many :comments

  def total_comments
    total_comments = self.comments.count
    self.comments.each { |comment| total_comments += comment.replies.count }
    total_comments
  end

end
