class SessionsController < ApplicationController
  skip_before_filter :allow
  def new
    if session[:admin_id]
      redirect_to admins_url , :notice => "Already logged in !"
    end
  end

  def create
  	admin = Admin.authorize(params[:username], params[:password])

  	if admin
     	session[:admin_id] = admin.id
  		redirect_to admins_url, :notice => "Logged in"
   	else
   		flash.now.alert = "Invalid credentials !" 	
   		render "new"
  	end

  end

  def destroy
  	session[:admin_id] = nil
  	redirect_to :root, :notice => "Logged out" 
  end
end
