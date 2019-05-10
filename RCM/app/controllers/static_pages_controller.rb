class StaticPagesController < ApplicationController
	before_action 	:authenticate_user!, :except => [:simple_character, :index]
	before_action :check
	def index
	end
  	
  	
  	def home
  	end

  	def simple_character
  	end
	 
  	def profile
  	end

private 

	def check
		if (params[:action] == "index" || params[:action] == "simple_character") && user_signed_in?
			redirect_to static_pages_home_url
		end		
	end

end