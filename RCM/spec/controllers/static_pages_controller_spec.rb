require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do    
	login_user

	it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should have a username" do
    expect(subject.current_user.username).to eq("test")
  end

  describe "GET home page" do
    it "gives a response status 200" do
      get :home
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :home
      expect(response.content_type).to eq "text/html"
    end

    it "renders the home page" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "GET profile" do
    it "gives a response status 200" do
      get :profile
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :profile
      expect(response.content_type).to eq "text/html"
    end

    it "renders the profile page" do
      get :profile
      expect(response).to render_template(:profile)
    end
  end

  describe "GET simple_character" do
    it "gives a response status 200" do
      get :simple_character
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :simple_character
      expect(response.content_type).to eq "text/html"
    end

    it "renders the simple_character page" do
      get :simple_character
      expect(response).to render_template(:simple_character)
    end
  end
end