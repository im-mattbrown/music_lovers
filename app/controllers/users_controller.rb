class UsersController < ApplicationController

  include AuthHelper

  before_action :find_user, only: [:show, :edit, :update]

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
    @user= User.find_by_id(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_steps_path
    else
      render :new
    end
  end

  def edit
    if !auth_through_user
      auth_fail("Uh Uh Uh", user_path)
    end
  end

  def update
    p "SHIT"
    if auth_through_user
      if @user.update(user_params)
        flash[:notice] = "Your profile was successfully updated."
        redirect_to user_path
      else
        redirect_to user_path
      end
    else
      auth_fail("uh uh uh", user_path)
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :seeking, :age, :profile_video, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :playlist, :suitors, :location, :profile_photo)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
