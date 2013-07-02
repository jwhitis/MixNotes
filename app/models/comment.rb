class Comment < ActiveRecord::Base
  attr_accessible :content, :mix_id, :time, :user_id
  validates_presence_of :content, :message => "Please type your comment in the text box."
  belongs_to :mix
  belongs_to :user
  has_many :replies, :dependent => :destroy
  include Formattable

  def convert_time
    min = (time / 60).floor
    sec = "%02d" % (time % 60)
    "#{min}:#{sec}"
  end

end
