class CommentsController < ApplicationController

  def create
    topic = Topic.find(params[:topic_id])
    topic.comments.create(params[:comment])
    redirect_to mix_path(topic.mix_id)
  end

end