class RepliesController < ApplicationController

  def create
    comment = Comment.find(params[:comment_id])
    comment.replies.create(params[:reply])
    redirect_to mix_path(comment.mix_id)
  end

end