class UsersController < ApplicationController

  def show
    @models = current_user.associated_models
  end

end