class PermissionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    save_if_user_exists(user, params)
    redirect_to mix_path(params[:permission][:mix_id])
  end

  private
  def save_if_user_exists user, params
    if user.nil?
      flash[:alert] = "#{params[:email]} is not a registered user."
    else
      permission = user.permissions.build(params[:permission])
      attempt_to_save(permission, user)
    end
  end

  def attempt_to_save permission, user
    if permission.save
      flash[:notice] = "#{user.email} has been successfully added to this mix."
    else
      flash[:alert] = permission.format_errors
    end
  end
  public

  def destroy
    permission = Permission.find(params[:id])
    permission.destroy
    redirect_to :root
  end

end