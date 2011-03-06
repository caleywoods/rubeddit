class UsersController < ApplicationController
  include UsersHelper

  def index
  end

  def show
    @user = User.find(params[:id])
    @karma = @user.karma(params[:id])
  end
end
