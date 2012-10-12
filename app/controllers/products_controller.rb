class ProductsController < ApplicationController
skip_before_filter :allow 

	def index
		@products = Product.order(:position).find_all_by_active_content(1)
    @employee = Employee.all

		respond_to do |format|
			format.html  # index.html.erb
		end
	end

	def new
    session[:return_to] = request.referer
    @products = Product.new
    3.times {@products.images.build}

    respond_to do |format|
      format.html # new.html.erb
    end
  end

	def create
		@products = Product.new(params[:product])

		respond_to do |format|
			if @products.save
			format.html { redirect_to session[:return_to], notice: 'Product was successfully added.' }
			else
         3.times {@products.images.build}
			format.html { render action: "new" }
			end
		end
	end

   def show
    @products = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb     
    end
  end

  def edit
    session[:return_to] = request.referer
    @products = Product.find(params[:id])
    3.times { @products.images.build }
  end

  def update 
    @products = Product.find(params[:id])

    respond_to do |format|
      if @products.update_attributes(params[:product])
        format.html { redirect_to session[:return_to], notice: 'Product was successfully updated'}
      else
        3.times { @products.images.build }
        format.html { render action: "edit"}
      end
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy

    respond_to do |format|
      format.html { redirect_to products_path }
    end
  end

  

end