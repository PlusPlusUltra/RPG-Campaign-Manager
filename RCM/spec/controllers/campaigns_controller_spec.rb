require "rails_helper"

RSpec.describe CampaignsController, :type => :controller do
	before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @campaign = FactoryGirl.create(:campaign)
  end

	describe "GET index of user's campaigns" do
    it "renders the campaigns list" do
      get :index, params: {user_id: @user.id} #user id here is 2
      expect(response).to render_template(:index)
    end
  end

  describe "Create a new campaign" do
    it "renders the new page" do
      get :new, params: {user_id: @user.id}
      expect(response).to render_template(:new)
    end

    it "creates the campaign" do
      post :create, params: {campaign: {title: "test campaign title",
      description: "test campaign description",
      user_id: @user.id
      },
    	user_id: @user.id}
      expect(response).to redirect_to('/users/2/campaigns/2')
    end
  end

  describe "Edit a campaign" do
		it "renders the edit page" do
      get :edit, params: {user_id: @user.id, id: @campaign.id}
      expect(response).to render_template(:edit)
    end

    it "edits the campaign" do
      patch :update, params: {campaign: {title: "edited test campaign title",
      description: "edited test campaign description",
      user_id: @user.id
      },
    	user_id: @user.id, id: @campaign.id
    	}
      expect(response).to redirect_to('/users/2/campaigns/1')
    end
  end

  describe "show user's campaign" do
    it "renders the campaign page" do
      get :show, params: {user_id: @user.id, id: @campaign.id} #user id here is 2
      expect(response).to render_template(:show)
    end
  end

  describe "Destroy user's campaign" do
  	it "deletes the user's campaign" do
  		delete :destroy, params: {user_id: @user.id, id: @campaign.id}
  		expect(response).to redirect_to('/users/2/campaigns')
  	end
  end
end