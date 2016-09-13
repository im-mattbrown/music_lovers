class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :seeking, :video, :answers, :playlist

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def finish_wizard_path
    user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :seeking, :age, :profile_video, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :playlist, :suitors, :location, :profile_photo)
  end
end
