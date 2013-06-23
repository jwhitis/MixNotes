class PermissionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user.nil?
      flash[:alert] = "#{params[:email]} is not a registered user."
    else
      permission = user.permissions.build(params[:permission])
      attempt_to_save(permission, user)
    end
    redirect_to mix_path(params[:permission][:mix_id])
  end

  def attempt_to_save permission, user
    if permission.save
      flash[:notice] = "#{user.email} has been successfully added to this mix."
    else
      flash[:alert] = "#{user.email} has already been added to this mix."
    end
  end

  def destroy
    permission = Permission.find(params[:id])
    permission.destroy
    redirect_to :root
  end

end