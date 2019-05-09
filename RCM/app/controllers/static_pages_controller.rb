class StaticPagesController < ApplicationController
	before_action 	:check

	def index
  	
	end
  	
  	
  	def home
  
  	end

  	def simple_character

  	end
 

private 

def check
	if (params[:action] == "index" || params[:action] == "simple_character") && user_signed_in?
		redirect_to static_pages_home_url
	elsif (params[:action] == "index" || params[:action] == "simple_character" )&& ! user_signed_in?
		nil
	elsif ! user_signed_in?
		redirect_to root_path
	elsif ! user_signed_in?
		redirect_to static_pages_home_url
	end

			
end

end