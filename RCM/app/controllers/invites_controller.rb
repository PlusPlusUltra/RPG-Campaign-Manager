class InvitesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@invites = Invite.where(:dest => @user.username)
	end

	def show
		@user = User.find(params[:user_id])
		@invite = Invite.find(params[:id])
		@invite.destid=@user.id
		Campaign.setDestId(@invite.destid)
	end
	
	def new
		@user = User.find(params[:user_id])
		@invite = Invite.new
	end

	def edit
		@user = User.find(params[:user_id])
		@invite = Invite.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@invite = @user.invites.new(invite_params)
		@invite.sender = @user.username
		@invite.campaign = Campaign.getLast
		@invite.campaignid = Campaign.getLastId
		@invite.senderid = @user.id
		
		if @invite.save
			redirect_to user_invites_path(@user)
		else
			render :new
		end
    
	end
	
	def userer
		@user = User.find(params[:user_id])
		Campaign.setUserer(@user)
	end
	
	
	def update
		@user = User.find(params[:user_id])
		@invite = Invite.find(params[:id])
 
		if @invite.update(invite_params)
			redirect_to user_invites_path(@user, @invite)
		else
    	render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@invite = Invite.find(params[:id])
#call destroy from show mybe solves problem
		@invite.destroy

		redirect_to user_invites_path(@user)
	end
	
	def accept
		@invite = Invite.find(params[:id])
		
		@sender = User.find(@invite.senderid)
		@owner = User.find(Campaign.getDestId)
		puts "ciaoz"
		puts(@owner)
		@campaign = Campaign.find(@invite.campaignid)
		@character_to_add = @owner.characters.find(2)
		#@character_to_add = Character.find(:first, conditions => [ "user_id = ?", @owner.id])
		@campaign.characters << @character_to_add
		destroy
	end
	helper_method :accept

	private def invite_params
		params.require(:invite).permit(:dest)
	end

	private def check
		@user = User.find(params[:user_id])
		if ((@user != current_user) && !current_user.admin?)
			redirect_to static_pages_home_url
		end
	end
end
