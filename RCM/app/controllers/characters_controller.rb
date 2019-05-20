class CharactersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@characters = Character.all
	end

	def show
		@character = Character.find(params[:id])
	end
	
	def new
		@character = Character.new
	end

	def edit
		@character = Character.find(params[:id])
	end

	def create
		@character = current_user.characters.new(character_params)

		if @character.save
			redirect_to @character
		else
			render 'new'
		end
	end

	def update
  	@character = Character.find(params[:id])
 
  	if @character.update(character_params)
    	redirect_to @character
  	else
    	render 'edit'
  	end
	end

	private def character_params
    params.require(:character).permit(:name, :lvl, :race, :class_type, :info)
  end

end
