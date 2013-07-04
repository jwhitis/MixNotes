class SessionsController < Devise::SessionsController

  def create
    super
    save_notifications
  end

  def save_notifications
    models = current_user.associated_models
    models.select! { |model| model.created_at > current_user.last_sign_in_at }
    models.each do |model|
      current_user.notifications.create(:model_class => model.class, :model_id => model.id)
    end
  end

end