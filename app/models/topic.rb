class Topic < ActiveRecord::Base
  attr_accessible :content, :mix_id, :time, :user_id
  belongs_to :mix, :dependent => :destroy
  belongs_to :user
  has_many :comments

  def convert_time time
    min = (time / 60).floor
    sec = "%02d" % (time % 60)
    "#{min}:#{sec}"
  end

end
