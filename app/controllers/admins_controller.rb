class AdminsController < ApplicationController

	def index
    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def new
    @admin = Admin.new
    index;
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
    if Admin.count > 2
      @admin = Admin.find(params[:id])
      @admin.destroy   
    end
    respond_to do |format|
      format.html { redirect_to  control_admins_url }
    end
  end

  def product
    @products = Product.order(:position)

    index;
  end

  def control
    @admins = Admin.find_all_by_super(0)

    index;
  end

  def image
    @image = Product.find(params[:id]).images.order(:position)

    index;
  end  

  def employee
    @employee = Employee.all
    index;
  end
end