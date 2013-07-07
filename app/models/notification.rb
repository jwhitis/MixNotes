class Notification < ActiveRecord::Base
  attr_accessible :model_class, :model_id, :read, :user_id
  belongs_to :user

  def self.find_by_model_and_user model, user
    where(:model_class => model.class.to_s, :model_id => model.id, :user_id => user.id).first
  end

end
