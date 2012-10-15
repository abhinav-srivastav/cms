class HomeController < ApplicationController
 skip_before_filter :allow
  def index
  	@employee = Employee.all
    @site = Site.all
    @maps_json = Site.first.to_gmaps4rails
    
    
  end

  def maps
  	@site = Site.all
    @maps_json = Site.first.to_gmaps4rails
  
  end

end