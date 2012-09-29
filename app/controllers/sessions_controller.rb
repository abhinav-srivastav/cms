class SessionsController < ApplicationController
  def new
  end

  def create
  	admin = Admin.find_by_username(params[:username])

  end

  def destroy
  end
end
