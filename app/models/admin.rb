class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :confirm_password
  validate :username, presence: true, uniqueness: true
  has_secure_password


    def self.authorize(username, password)
      admin = Admin.find_by_username(username)
      if admin && admin.authenticate(password)
        admin
      else
        nil
      end
  	end
end
