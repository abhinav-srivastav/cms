class AdminsController < ApplicationController

	def index
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

    respond_to do |format|
      format.html #product.html.erb
    end
  end

  def control
    @admins = Admin.find_all_by_super(0)

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def image
    @image = Product.find(params[:id]).images.order(:position)

    respond_to do |format|
      format.html #image_show.html.erb
    end
  end

  def sorting
    tablename = params[:tablename]
    record = tablename.constantize.find(params[:first_id])
    record.insert_at(position = (params[:first_position]).to_i)    
    record = tablename.constantize.find(params[:last_id])
    record.insert_at(position = (params[:last_position]).to_i)    
  end


  def employee
    @employee = Employee.all

    respond_to do |format|
      format.html
    end
  end
end