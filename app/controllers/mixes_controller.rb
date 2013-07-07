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
    mix = current_user.mixes.build(params[:mix])
    attempt_to_save(mix)
    redirect_to :root
  end

  def attempt_to_save mix
    if current_user.save
      flash[:notice] = "\"#{mix.title}\" has been successfully uploaded."
    else
      flash[:alert] = mix.format_errors
    end
  end
  private :attempt_to_save

  def show
    @mix = Mix.find(params[:id])
    @permission = Permission.new
    @comment = Comment.new
    @reply = Reply.new
  end

  def destroy
    mix = Mix.find(params[:id])
    mix.destroy
    redirect_to :root
  end

end