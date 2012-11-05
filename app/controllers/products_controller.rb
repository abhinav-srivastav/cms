class ProductsController < ApplicationController

	def new
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
			format.html { redirect_to product_admins_path, notice: 'Product was successfully added.' }
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
    @image = Product.find(params[:id]).images.order(:position)
    @products = Product.find(params[:id])
    @products.images.build
  end


  def update_img
    @image = Image.find(params[:id])
    if params[:commit] 
      respond_to do |format|
        if @image.update_attributes(params[:image])
          format.html { redirect_to edit_product_path(@image.product) }
        else
          format.html { render action: "edit_img"}
        end
      end
    else
      redirect_to request.referer
    end
  end

  def update 
    @products = Product.find(params[:id])

    respond_to do |format|
      if @products.update_attributes(params[:product])
        format.html { redirect_to product_admins_path, notice: 'Product was successfully updated'}
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

  def remove_img
    @image = Image.find(params[:image_id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end 
  
  def edit_image
    @image1 = Image.find(params[:id])
  end
end