class UsersController < ApplicationController

  def index
    @user = User.new
    redirect_to users_path
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :seeking, :age, :profile_video, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :playlist, :suitors, :location)
  end
end
