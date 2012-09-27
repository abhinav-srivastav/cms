class HomeController < ApplicationController
  def index
  	@products = Product.order(:active_content)
  end
end
