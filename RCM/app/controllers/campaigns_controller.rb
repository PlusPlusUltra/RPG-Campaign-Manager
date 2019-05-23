class CampaignsController < ApplicationController
	before_action :authenticate_user!
	before_action :check
	
	def index
		@user = User.find(params[:user_id])
		@campaigns = @user.campaigns
	end

	def show
		@user = User.find(params[:user_id])
		@campaign = Campaign.find(params[:id])
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
