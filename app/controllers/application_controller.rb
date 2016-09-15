class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def not_found
  render :file => "public/404"
  end

end
