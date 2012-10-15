class Site < ActiveRecord::Base  
  acts_as_gmappable 
  # :lat => :latitude, :lng => :longitude, :check_process => false
  attr_accessible :address, :gmaps, :latitude, :longitude, :name
  # validate_presence_of :address, :name
  
  def gmaps4rails_address
  	address
  end

  def gmaps4rails_infowindow
    "<h3>#{name}</h3>"
  end

end