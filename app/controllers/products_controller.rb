class ProductsController < ApplicationController
skip_before_filter :allow 

	def index
		@products = Product.order(:position).find_all_by_active_content(true)

		respond_to do |format|
			format.html  # index.html.erb
		end
	end

	def new
    session[:return_to] = request.referer
    @products = Product.new
    @products.images.build

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
        @products.images.build
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
    @image = Product.find(params[:id]).images.order(:position)
    @products = Product.find(params[:id])
    @products.images.build
  end

  def update 
    @products = Product.find(params[:id])

    respond_to do |format|
      if @products.update_attributes(params[:product])
        format.html { redirect_to session[:return_to], notice: 'Product was successfully updated'}
      else
        @products.images.build
        format.html { render action: "edit"}
      end
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end

  def sorting
    tablename = params[:tablename]
    record = tablename.constantize.find(params[:first_id])
    record.insert_at(position = (params[:first_position]).to_i)    
    record = tablename.constantize.find(params[:last_id])
    record.insert_at(position = (params[:last_position]).to_i)    
  end

  

end