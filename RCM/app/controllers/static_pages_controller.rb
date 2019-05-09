class StaticPagesController < ApplicationController
	before_action 	:check

	def index
  	
	end
  	
  	
  	def home
  
  	end

 

private 

def check
	if params[:action] == "index" && user_signed_in?
		redirect_to static_pages_home_url
	elsif params[:action] == "index" && ! user_signed_in?
		nil
	elsif ! user_signed_in?
		redirect_to root_path
	elsif ! user_signed_in?
		redirect_to static_pages_home_url
	end

			
end

end