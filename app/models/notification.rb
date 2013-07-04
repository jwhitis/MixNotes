class Notification < ActiveRecord::Base
  attr_accessible :model_class, :model_id, :read, :user_id
  belongs_to :user

  def self.find_id_by_model model
    Notification.all.each do |notification|
      if model.class == notification.model_class || model.id == notification.model_id
        return notification.id
      end
    end
    nil
  end

end
