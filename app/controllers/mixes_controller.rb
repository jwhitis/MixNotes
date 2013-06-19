class MixesController < ApplicationController

  def index
    if user_signed_in?
      @mixes = current_user.mixes
      @mix = Mix.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    current_user.mixes.create(params[:mix])
    redirect_to :root
  end

  def add_user
    user = User.where(:email => params[:email]).first
    if user.nil?
      flash[:alert] = "#{params[:email]} is not a registered user."
    else
      permission = user.permissions.build({:mix_id => params[:mix_id]})
      if permission.save
        flash[:notice] = "#{user.email} has been successfully added to this mix."
      else
        flash[:alert] = "#{user.email} already has access to this mix."
      end
    end
    redirect_to mix_path(params[:mix_id])
  end

  def show
    @mix = Mix.find(params[:id])
    @comment = Comment.new
    @reply = Reply.new
  end

  def destroy
    @mix = Mix.find(params[:id])
    @mix.destroy
    redirect_to :root
  end

end