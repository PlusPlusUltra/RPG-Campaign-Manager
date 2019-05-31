require "rails_helper"

RSpec.describe User, :type => :model do

  describe "User's parameter validation" do
    it "User's validation" do
      user = User.new(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
      expect(user).to be_valid
    end
  end

  it "User creation" do
    user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
    expect(User.first).to eq(user)
  end

  it "User without email" do
    user = User.new(:password => "password", :password_confirmation => "password", :username => "test")
    expect(user).not_to be_valid
  end

  it "User whithout username" do
    user = User.new(:email => "test@test.it", :password => "password", :password_confirmation => "password")
    expect(user).not_to be_valid
  end

  it "User whithout password" do
    user = User.new(:email => "test@test.it", :password_confirmation => "password", :username => "password")
    expect(user).not_to be_valid
  end

  it "Assign Campaign to User" do
    user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
    campaign = user.campaigns.create!(:title => "test campaign", :description => "description for test campaign")
    expect(user.reload.campaigns.first).to eq(campaign)
  end

  it "Assign character to User" do
    user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
    character = user.characters.create!(:name => "test character", :lvl => "1", :class_type => "class1", :race => "race1", :info => "test character info")
    expect(user.reload.characters.first).to eq(character)
  end 


  it "destroys dependent Characters" do
    user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
    character = user.characters.create!(:name => "test character", :lvl => "1", :class_type => "class1", :race => "race1", :info => "test character info")
    character2 = user.characters.create!(:name => "test character1", :lvl => "2", :class_type => "class1", :race => "race1", :info => "test character info")
    
    user.characters << character
    user.characters << character2

    expect { user.destroy }.to change { Character.count }.by(-2)
  end

  it "destroys dependent Campaigns" do
    user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
    campaign = user.campaigns.create!(:title => "test campaign", :description => "description for test campaign")
    campaign2 = user.campaigns.create!(:title => "test campaign2", :description => "description for test campaign2")

    user.campaigns << campaign
    user.campaigns << campaign2

    expect { user.destroy }.to change { Campaign.count }.by(-2)
  end
end
