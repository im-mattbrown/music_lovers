class User < ApplicationRecord
  has_secure_password

  cattr_accessor :current_user

  SEEKING = ['f4f', 'f4m', 'm4f', 'm4m']

  validates :first_name, :last_name, :password, :seeking, :age, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :playlist, :suitors, :location, :profile_photo,
    presence: true

  validates :username,
    presence: true,
    uniqueness: true,
    length: { minimum: 1, maximum: 50 }

  validates :profile_video,
    presence: true,
    length: {minimum: 1, maximum: 11 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence: true,
    format: { with: EMAIL_REGEX},
    uniqueness: true,
    length: { maximum: 50 }

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end
end
