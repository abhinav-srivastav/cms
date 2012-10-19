class Product < ActiveRecord::Base
	acts_as_list

	attr_accessible :name, :description, :active_content, :images_attributes, :position, :preview
	has_many :images, :dependent => :destroy, :autosave => true
	accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => lambda { |a| a[:image].blank? }
	validates :name, :description, presence: true
	validates_uniqueness_of :name


	scope :active_content, where(:active_content => true)
	scope :preview, where("active_content = ? OR preview = ?", true, true)
end