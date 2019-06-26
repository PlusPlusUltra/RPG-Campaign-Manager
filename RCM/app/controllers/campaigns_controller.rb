class CampaignsController < ApplicationController
	before_action :authenticate_user!
	before_action :check, except: [:show]
	
	def index
		@user = User.find(params[:user_id])
		@campaigns = @user.campaigns
	end

	def show
		@user = User.find(params[:user_id])
		@campaign = Campaign.find(params[:id])
		@characters = @campaign.characters
	end
	
	def new
		@user = User.find(params[:user_id])
		@campaign = Campaign.new
	end

	def edit
		@user = User.find(params[:user_id])
		@campaign = Campaign.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@campaign = current_user.campaigns.new(campaign_params)
		@campaign.master = current_user.username

		if @campaign.save
			redirect_to user_campaign_path(@user, @campaign)
		else
			render :new
		end
	end

	def update
		@user = User.find(params[:user_id])
  	@campaign = Campaign.find(params[:id])
 
  	if @campaign.update(campaign_params)
    	redirect_to user_campaign_path(@user, @campaign)
  	else
    	render 'edit'
  	end
	end

	def destroy
		@user = User.find(params[:user_id])
		@campaign = @user.campaigns.find(params[:id])
		@campaign.destroy

		redirect_to user_campaigns_path(@user)
	end

	def manage_characters
		@user = User.find(params[:user_id])
		@campaign = @user.campaigns.find(params[:id])
		@characters = @campaign.characters
	end

	def remove_character
		@user = User.find(params[:user_id])
		@campaign = @user.campaigns.find(params[:id])
		@characters = @campaign.characters
		@characters.delete(params[:c])

		redirect_to manage_characters_path
	end

	#This is just a proof of concept. It works but it needs changes. Also it needs a check to
	#see to whom the character belogns to
	def add_character
		@campaign = Campaign.find(params[:id])
		@character_to_add = Character.find_by_name(params[:character][:character_id])
		@owner_of_c=User.find(@character_to_add.user_id)
		@campaign.characters << @character_to_add
		redirect_to manage_characters_path
	end
	def accept_invite
		@user = Campaign.getUserer
		
	end
	def inviter
		@user=User.find(params[:user_id])
		@campaign = @user.campaigns.find(params[:id])
		Campaign.setLast(@campaign.title)
		Campaign.setLastId(@campaign.id)
		redirect_to new_user_invite_path
	end
	#helper_method :invite
	
	def accept
		#@owner = User.find(params[:user_id])
		
		@invite = Invite.find(params[:id])
		@owner = @User.find(@invite.destid)
		@sender = User.find(@invite.senderid)
		@campaign = Campaign.find(@invite.campaignid)
		@character_to_add = @owner.characters.find(1)
		@campaign.characters << @character_to_add
		destroy
	end
	#helper_method :accept


	private def campaign_params
    params.require(:campaign).permit(:title, :description)
  end

  private def check
  	@user = User.find(params[:user_id])
  	if ((@user != current_user) && !current_user.admin?)
			redirect_to static_pages_home_url
		end
  end

end
