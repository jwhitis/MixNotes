class PermissionsController < ApplicationController

  def create
    user = User.where(:email => params[:email]).first
    if user.nil?
      flash[:alert] = "#{params[:email]} is not a registered user."
    else
      permission = user.permissions.build(params[:permission])
      if permission.save
        flash[:notice] = "#{user.email} has been successfully added to this mix."
      else
        flash[:alert] = "#{user.email} has already been added to this mix."
      end
    end
    redirect_to mix_path(params[:permission][:mix_id])
  end

end