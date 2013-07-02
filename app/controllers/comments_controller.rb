class CommentsController < ApplicationController

  def create
    mix = Mix.find(params[:mix_id])
    comment = mix.comments.build(params[:comment])
    attempt_to_save(comment)
    redirect_to mix_path(params[:mix_id])
  end

  def attempt_to_save comment
    unless comment.save
      flash[:alert] = comment.format_errors
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to mix_path(params[:mix_id])
  end

end