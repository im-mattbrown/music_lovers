class UsersController < ApplicationController

  def index
    @user = User.new
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create
  end
end
