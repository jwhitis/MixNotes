class RepliesController < ApplicationController

  def create
    topic = Topic.find(params[:topic_id])
    topic.replies.create(params[:reply])
    redirect_to mix_path(topic.mix_id)
  end

end