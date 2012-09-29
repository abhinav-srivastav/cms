class AdminsController < ApplicationController

	def index
    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def product
    @products = Product.all

    respond_to do |format|
      format.html #product.html.erb
    end
	end

  def control
    @admins = Admin.order(:id)

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create 
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to control_admins_url, notice: "user created" }
      else
        format.html { render action: "new"}
      end        
    end
  end

  def edit 
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to control_admins_url, notice: "user updated" }
      else
        format.html { render action: "edit" }        
      end  
    end
  end

  def destroy
    if Admin.count > 1
      @admin = Admin.find(params[:id])
      @admin.destroy   
    end
    respond_to do |format|
      format.html { redirect_to  control_admins_url }
    end
  end

end