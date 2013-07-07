class PermissionsController < ApplicationController
  include Saveable

  def create
    user = User.find_by_email(params[:email])
    save_if_user_exists(user, params)
    redirect_to mix_path(params[:permission][:mix_id])
  end

  def save_if_user_exists user, params
    if user.nil?
      flash[:alert] = "#{params[:email]} is not a registered user."
    else
      permission = user.permissions.build(params[:permission])
      attempt_to_save(permission, "#{user.email} has been successfully added to this mix.")
    end
  end
  private :save_if_user_exists

  def destroy
    permission = Permission.find(params[:id])
    permission.destroy
    redirect_to :root
  end

end