class SessionsController < Devise::SessionsController

  def create
    super
    current_user.save_notifications
  end

  def destroy
    current_user.update_last_sign_out_at
    super
  end

end