class ApplicationController < ActionController::Base
	def authenticate_user!
    	if user_signed_in?
      		super
    	else
      	redirect_to static_page_index_url, :notice => 'if you want to add a notice'
      	## if you want render 404 page
      	## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      	end
    end
end
