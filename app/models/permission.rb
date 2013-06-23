class Permission < ActiveRecord::Base
  attr_accessible :mix_id, :user_id
  belongs_to :mix
  belongs_to :user
  validates_uniqueness_of :mix_id, :scope => :user_id

  def self.find_by_user user
    where(:user_id => user.id).first
  end

end
