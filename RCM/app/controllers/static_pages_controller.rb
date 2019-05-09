class StaticPagesController < ApplicationController
	before_action 	:check

	def index
  	
	end
  	
  	
  	def home
  
  	end

 

private 

def check
	if params[:action] == "index"
		:authenticate_user!
	else
		redirect_to user_session_path
	end
			
end

end