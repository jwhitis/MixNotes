class RepliesController < ApplicationController

  def create
    comment = Comment.find(params[:comment_id])
    comment.replies.create(params[:reply])
    redirect_to mix_path(params[:mix_id])
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to mix_path(params[:mix_id])
  end

end