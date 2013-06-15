class MixesController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @mixes = Mix.all
    @mix = Mix.new
  end

  def create
    current_user.mixes.create( params[:mix] )
    redirect_to :root
  end

  def show
    @mix = Mix.find( params[:id] )
  end

  def destroy
    @mix = Mix.find( params[:id] )
    @mix.destroy
    redirect_to mixes_path
  end

end