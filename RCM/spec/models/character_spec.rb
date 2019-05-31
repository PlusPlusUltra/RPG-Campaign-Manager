require "rails_helper"

RSpec.describe Character, :type => :model do
  
  describe "Creating character without a name" do
    it "should not succeed" do
      character = Character.new(:lvl => "1", :class_type => "class1", :race => "race1", :info => "test")
      expect(character).not_to be_valid
    end
  end

  describe "Creating character without info" do
    it "should not succeed" do
      character = Character.new(:name => "test",  :lvl => "1", :class_type => "class1", :race => "race1")
      expect(character).not_to be_valid
    end
  end

  describe "Creating character without a level" do
    it "should not succeed" do
      character = Character.new(:name => "test",  :class_type => "class1", :race => "race1", :info => "test")
      expect(character).not_to be_valid
    end
  end

  describe "Creating character without a class" do
    it "should not succeed" do
      character = Character.new(:name => "test", :lvl => "1", :race => "race1", :info => "test")
      expect(character).not_to be_valid
    end
  end

  describe "Creating character without a race" do
    it "should not succeed" do
      character = Character.new(:name => "test", :lvl => "1", :class_type => "class1", :info => "test")
      expect(character).not_to be_valid
    end
  end

  describe "Character level out of range" do
    it "should not succeed" do
      character = Character.new(:name => "test", :lvl => "30", :race =>"race1", :class_type => "class1", :info => "test")
      expect(character).not_to be_valid
    end
  end

  describe "Correct character creation" do
    it "should create the character" do
      user = User.create(:email => "test@test.it", :password => "password", :password_confirmation => "password", :username => "test")
      character = Character.new(:name => "test campaign", :lvl => "1", :class_type => "class1", :race => "race1", :info => "test")
      expect(character).to be_valid
      character.save
      expect(Character.first).to eq(character)
    end
  end

end