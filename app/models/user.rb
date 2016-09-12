class User < ApplicationRecord
  has_secure_password

  cattr_accessor :current_user
  
  SEEKING = ['f4f', 'f4m', 'm4f', 'm4m']
end
