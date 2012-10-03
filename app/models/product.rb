class Product < ActiveRecord::Base
	attr_accessible :name, :description, :active_content, :images_attributes
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true
	validates :name, presence: true, uniqueness: true
end