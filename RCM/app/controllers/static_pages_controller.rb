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
  	def change_role
  		@user=User.find(params[:id])
  		@user.update_attribute(:admin, !@user.admin?)
  		redirect_to static_pages_show_all_users_url
  	end

private 

	def check
		if (params[:action] == "index" || params[:action] == "simple_character") && user_signed_in?
			
			redirect_to static_pages_home_url
		end
		if params[:action] == "show_all_users" && !current_user.admin?
			redirect_to static_pages_home_url
		end
		if user_signed_in? && !current_user.admin? && (current_user.email =="pivarim@gmail.com" || current_user.email =="perottofederico@gmail.com" ||current_user.email =="deluca.1753532@studenti.uniroma1.it")
				current_user.update_attribute :admin, true
			end
	end

end