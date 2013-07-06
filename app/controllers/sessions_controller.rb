class SessionsController < Devise::SessionsController

  def create
    super
    save_notifications
  end

  def save_notifications
    models = current_user.associated_models
    models = created_since_last_sign_out(models)
    models.each do |model|
      current_user.notifications.create(:model_class => model.class.to_s, :model_id => model.id)
    end
  end

  def created_since_last_sign_out models
    if current_user.last_sign_out_at.nil?
      models
    else
      models.select { |model| model.created_at > current_user.last_sign_out_at }
    end
  end

  def destroy
    current_user.last_sign_out_at = DateTime.now
    current_user.save
    super
  end

end