class UsersController < ApplicationController
  
  def index
  end

  def show
    @links = current_user.links
    @user = current_user
  end
end
