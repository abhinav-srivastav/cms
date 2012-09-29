class Product < ActiveRecord::Base
	attr_accessible :name, :description, :active_content
	validates :name, presence: true, uniqueness: true
end