class Mix < ActiveRecord::Base
  attr_accessible :title, :artist, :admin, :audio
  validates_presence_of :title, :message => "Title can't be blank."
  validates_presence_of :artist, :message => "Artist can't be blank."
  # validates_presence_of :audio, :message => "Choose a valid audio file."
  has_many :permissions, :dependent => :destroy
  has_many :users, :through => :permissions
  has_many :comments, :dependent => :destroy
  mount_uploader :audio, AudioUploader
  include Formattable

  def associated_models
    models = []
    models.concat self.permissions
    models.concat self.comments
    self.comments.each { |comment| models.concat comment.replies }
    models
  end

  def total_comments
    total_comments = self.comments.count
    self.comments.each { |comment| total_comments += comment.replies.count }
    total_comments
  end

end
