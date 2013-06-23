class CommentsController < ApplicationController

  def create
    mix = Mix.find(params[:mix_id])
    mix.comments.create(params[:comment])
    redirect_to mix_path(params[:mix_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to mix_path(params[:mix_id])
  end

end