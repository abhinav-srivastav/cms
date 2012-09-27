class ProductsController < ApplicationController

	def index
		@products = Product.all

		respond_to do |format|
			format.html  # index.html.erb
		end

	end

end