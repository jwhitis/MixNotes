class NotificationsController < ApplicationController

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    respond_to { |format| format.html {head :ok} }
  end

end