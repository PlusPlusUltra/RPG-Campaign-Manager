require "rails_helper"

RSpec.describe Character, :type => :model do
  
  describe "Creating campaign without a title" do
  	it "should not succeed" do
      campaign = Campaign.new(:description => "test description campaign")
      expect(campaign).not_to be_valid
    end
  end

  describe "Creating campaign without a description" do
  	it "should not succeed" do
      campaign = Campaign.new(:title => "test title campaign")
      expect(campaign).not_to be_valid
    end
  end

  describe "Correct campaign creation" do
    it "should create the campaign" do
      user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
      campaign = Campaign.new(:title => "test title campaign", :description => "test description campaign")
      expect(campaign).to be_valid
      campaign.save
      expect(Campaign.first).to eq(campaign)
    end
  end

end