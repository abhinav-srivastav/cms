class EmployeesController < ApplicationController
  
  def new  	
  	@employee = Employee.new

 	  respond_to do |format|
  		format.html 
  	end
  end

  def create 
  	@employee = Employee.new(params[:employee])

  	respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_admins_url, notice: "employee created" }
      else
        format.html { render action: "new"}
      end        
    end
  end

  def edit
	@employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update_attributes(params[:admin])
        format.html { redirect_to employee_admins_url, notice: "employee updated" }
      else
        format.html { render action: "edit" }        
      end  
    end
  end

  def destroy
  	@employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employee_admins_path, notice: "employee removed !"  }
    end
  end
end