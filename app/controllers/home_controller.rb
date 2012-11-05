class HomeController < ApplicationController
 skip_before_filter :allow
  def index
  	@employee = Employee.order(:position)
    
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

 
end