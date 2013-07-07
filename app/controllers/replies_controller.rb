class RepliesController < ApplicationController
  include Saveable

  def create
    comment = Comment.find(params[:comment_id])
    reply = comment.replies.build(params[:reply])
    attempt_to_save(reply)
    redirect_to mix_path(params[:mix_id])
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to mix_path(params[:mix_id])
  end

end