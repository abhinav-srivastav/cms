class HomeController < ApplicationController
 skip_before_filter :allow
  def index
  	@employee = Employee.order(:position)
    @site = Site.all
    @maps_json = Site.first.to_gmaps4rails   
  end

  def products
  	if session[:admin_id]
		  @products = Product.order(:position).preview
		else
      @products = Product.order(:position).active_content
    end
    @employee = Employee.order(:position)
    respond_to do |format|
			format.html  # index.html.erb
		end
  end

  def maps
  	@site = Site.all
    @maps_json = Site.first.to_gmaps4rails
  
  end

end