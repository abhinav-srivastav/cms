class HomeController < ApplicationController
 skip_before_filter :allow
  def index
  	@products = Product.order(:active_content)
  	@employee = Employee.all
  end


end