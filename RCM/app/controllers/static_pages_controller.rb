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

  	def show_all_users
  		@users= User.all
  	end

private 

	def check
		if (params[:action] == "index" || params[:action] == "simple_character") && user_signed_in?
			if current_user.email =="pivarim@gmail.com"
				current_user.update_attribute :admin, true
			end
			redirect_to static_pages_home_url
		end
		if params[:action] == "show_all_users" && !current_user.admin?
			redirect_to static_pages_home_url
		end
	end

end