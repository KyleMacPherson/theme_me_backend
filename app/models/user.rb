require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :sounds
  has_secure_password
  validates_presence_of :password, :on => :create

end
