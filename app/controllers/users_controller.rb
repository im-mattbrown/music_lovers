class UsersController < ApplicationController

  include AuthHelper

  before_action :logged_in?, except: [:index, :new, :create]  
  before_action :find_user, only: [:show, :edit, :update, :video, :answers, :playlist]

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:notice] = "Congratulations, you have successfully signed up!"
      redirect_to user_steps_path
    else
      flash[:notice] = "Sorry, please try again.There are some issues:  #{@user.errors.full_messages.join(', ')}."
      redirect_to new_user_path
    end
  end

  def edit
    if !auth_through_user
      auth_fail("Uh Uh Uh", user_path)
    end
  end

  def update
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

  def video
    #flash.now[:notice] = "Here is your potential matches profile video, proceed to judge them by it."
  end

  def answers
    #flash.now[:notice] = "Here is your potential matches answers, please continue the judging."
  end

  def playlist
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :profile_photo)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
