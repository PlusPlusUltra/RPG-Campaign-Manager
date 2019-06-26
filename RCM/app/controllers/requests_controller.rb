class RequestsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@requests = Request.where(:dest => @user.username)
	end
	def show
		@user = User.find(params[:user_id])
		@request = Request.find(params[:id])
		@request.destid=@user.id
		#Campaign.setDestId(@invite.destid)
	end
	def new
		@user = User.find(params[:user_id])
		@request = Request.new
	end
	def edit
		@user = User.find(params[:user_id])
		@request = Invite.find(params[:id])
	end
	def create
		@user = User.find(params[:user_id])
		@request = @user.requests.new(request_params)
		@request.sender = @user.username
		#@invite.campaign = Campaign.getLast
		#@invite.campaignid = Campaign.getLastId
		@request.senderid = @user.id
		
		if @request.save
			redirect_to user_requests_path(@user)
		else
			render :new
		end
	end
    def update
		@user = User.find(params[:user_id])
		@request = Request.find(params[:id])
 
		if @invite.update(invite_params)
			redirect_to user_requests_path(@user, @request)
		else
    	render 'edit'
		end
	end
	def destroy
		@user = User.find(params[:user_id])
		@request = Request.find(params[:id])
#call destroy from show mybe solves problem
		@request.destroy

		redirect_to user_requests_path(@user)
	end
	def accept
		@request = Request.find(params[:id])
		puts(@request.campaign)
		@sender = User.find(@request.senderid)
		
		
		#@campaign = Campaign.find(@invite.campaignid)
		@campaign = Campaign.find_by(title: @request.campaign)
		@character_to_add = @sender.characters.find(params[:character[character_id]])
		#@character_to_add = Character.find(:first, conditions => [ "user_id = ?", @owner.id])
		@campaign.characters << @character_to_add
		destroy
	end
	helper_method :accept
	
	private def request_params
		params.require(:request).permit(:dest, :campaign)
	end

end
