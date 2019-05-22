class CharactersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@user = User.find(params[:user_id])
		@characters = @user.characters
	end

	def show
		@user = User.find(params[:user_id])
		@character = Character.find(params[:id])
	end
	
	def new
		@user = User.find(params[:user_id])
		@character = Character.new
	end

	def edit
		@user = User.find(params[:user_id])
		@character = Character.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@character = @user.characters.new(character_params)

    if @character.save
      redirect_to user_character_path(@user, @character)
    else
    	render :new
    end
    
	end

	def update
		@user = User.find(params[:user_id])
  	@character = Character.find(params[:id])
 
  	if @character.update(character_params)
    	redirect_to user_character_path(@user, @character)
  	else
    	render 'edit'
  	end
	end

	def destroy
		@user = User.find(params[:user_id])
		@character = @user.characters.find(params[:id])
		@character.destroy

		redirect_to user_characters_path(@user)
	end

	private def character_params
    params.require(:character).permit(:name, :lvl, :race, :class_type, :info)
  end

end
