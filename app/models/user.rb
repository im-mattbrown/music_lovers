class User < ApplicationRecord
  has_secure_password

  cattr_accessor :current_user
  #attr_accessible :link

  SEEKING = ['f4f', 'f4m', 'm4f', 'm4m']

    def self.confirm(params)
      @user = User.where("email ILIKE ?", params[:email]).first
      @user.try(:authenticate, params[:password])
    end
end
