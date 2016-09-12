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

  private

  def user_params
    params.require(:user).permit(:age, :location, :seeking)
  end
end
