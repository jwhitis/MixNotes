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