class PlannersController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@planners = Planner.where(:dest => @user.username)
		#modify later
		@myP = @user.planners
	end
	def show
		@user = User.find(params[:user_id])
		@planner = Planner.find(params[:id])
		@planner.destid=@user.id
	end
	
	def new
		@user = User.find(params[:user_id])
		@planner = Planner.new
	end

	def edit
		@user = User.find(params[:user_id])
		@planner = Planner.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@planner = @user.planners.new(planner_params)
		@planner.sender = @user.username
		@planner.senderid = @user.id
		
		if @planner.save
			redirect_to user_planners_path(@user)
		else
			render :new
		end
    
	end	
	def update
		@user = User.find(params[:user_id])
		@planner = Planner.find(params[:id])
 
		if @planner.update(invite_params)
			redirect_to user_planners_path(@user, @planner)
		else
    	render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@planner = Planner.find(params[:id])
#call destroy from show mybe solves problem
		@planner.destroy

		redirect_to user_planners_path(@user)
	end
	
	def accept
		@planner = Planner.find(params[:id])
		@planner.answer = "yes"
		@planner.save
	end
	helper_method :accept

	private def planner_params
		params.require(:planner).permit(:dest, :day, :month, :year)
	end

	private def check
		@user = User.find(params[:user_id])
		if ((@user != current_user) && !current_user.admin?)
			redirect_to static_pages_home_url
		end
	end
end
