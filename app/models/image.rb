class Image < ActiveRecord::Base
	attr_accessible :image
	belongs_to :product
	has_attached_file :image, :styles => { :small => "100x100>" },
          	    					  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
 	  			           			  :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end