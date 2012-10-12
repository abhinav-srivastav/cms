class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :allow



  
  helper_method :current_user
	private
	def current_user
	  @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def allow
		unless Admin.find_by_id(session[:admin_id])
			redirect_to sessions_url, notice: "Please log in"
		end
	end
end