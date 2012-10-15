class SitesController < ApplicationController
  
  def index
    @site = Site.all
    @json = Site.all.to_gmaps4rails
    respond_to do |format|
      format.html 
    end
  end

end
