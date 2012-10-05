class Image < ActiveRecord::Base
	acts_as_list

	attr_accessible :image, :position
	belongs_to :product
	has_attached_file :image, :styles => { :small => "150x150>" },
          	    					  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
 	  			           			  :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end