class MessagesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@messages = Message.where(:dest => @user.username)
	end

	def show
		@user = User.find(params[:user_id])
		@message = Message.find(params[:id])
	end
	
	def new
		@user = User.find(params[:user_id])
		@message = Message.new
	end

	def edit
		@user = User.find(params[:user_id])
		@message = Message.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@message = @user.messages.new(message_params)

    if @message.save
      redirect_to user_message_path(@user, @message)
    else
    	render :new
    end
    
	end

	def update
		@user = User.find(params[:user_id])
  	@message = Message.find(params[:id])
 
  	if @message.update(message_params)
    	redirect_to user_messages_path(@user, @message)
  	else
    	render 'edit'
  	end
	end

	def destroy
		@user = User.find(params[:user_id])
		@message = @user.messages.find(params[:id])
		@message.destroy

		redirect_to user_messages_path(@user)
	end

	private def message_params
    params.require(:message).permit(:dest, :campaign, :sender)
  end

  private def check
  	@user = User.find(params[:user_id])
  	if ((@user != current_user) && !current_user.admin?)
			redirect_to static_pages_home_url
		end
  end
end
