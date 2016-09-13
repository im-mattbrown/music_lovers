module AuthHelper
  def auth_through_user
    current_user != nil && current_user.id == @user.id
  end

  def auth_fail(reason, redirect_path)
    flash[:notice] = reason
    flash[:bruh] = true
    redirect_to redirect_path
  end
end
