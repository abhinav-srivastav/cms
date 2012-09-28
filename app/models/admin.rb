class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :confirm_password
  validate :username, presence: true, uniqueness: true
  has_secure_password
end
