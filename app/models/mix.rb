class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :admin, :audio
  has_many :permissions, :dependent => :destroy
  has_many :users, :through => :permissions
  has_many :comments, :dependent => :destroy
  mount_uploader :audio, AudioUploader
  include Formattable

  def total_comments
    total_comments = self.comments.count
    self.comments.each { |comment| total_comments += comment.replies.count }
    total_comments
  end

end
