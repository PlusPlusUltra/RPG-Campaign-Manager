class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	skip_before_action :authenticate_user!, raise: false
  	
def all
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
            flash[:notice] = "you are successfully logged in!!"
            sign_in_and_redirect(user)
        else
            session["devise.user_attributes"] = user.attributes
            redirect_to new_user_registration_url
        end
  end

  def failure
    super
  end

  alias_method :google_oauth2, :all
end

#  	def google_oauth2
#    	@user = User.from_omniauth(request.env["omniauth.auth"],current_user)
#    	if @user
#      		sign_in @user
#      		redirect_to root_path
#    	else
#      		redirect_to new_user_session_path, notice: 'Access Denied.'
#    	end
#  	end
#end 