class TopicsController < ApplicationController

  def create
    mix = Mix.find(params[:mix_id])
    mix.topics.create(params[:topic])
    redirect_to mix_path(params[:mix_id])
  end

end