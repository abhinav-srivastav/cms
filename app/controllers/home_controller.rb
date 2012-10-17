class HomeController < ApplicationController
 skip_before_filter :allow
  def index
  	@employee = Employee.order(:position)
    @site = Site.all
    @maps_json = Site.all.to_gmaps4rails
    
    
  end

  def maps
  	@site = Site.all
    @maps_json = Site.all.to_gmaps4rails
  
  end

end