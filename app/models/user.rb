require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

end
