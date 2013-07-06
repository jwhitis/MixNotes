class Permission < ActiveRecord::Base
  attr_accessible :mix_id, :user_id
  validates_uniqueness_of :mix_id, :scope => :user_id,
    :message => "That user has already been added to this mix."
  belongs_to :mix
  belongs_to :user
  include Formattable

  def self.find_by_mix_and_user mix, user
    where(:mix_id => mix.id, :user_id => user.id).first
  end

end
