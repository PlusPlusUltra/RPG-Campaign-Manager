class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

#  def google_oauth2
#    @user = User.from_omniauth(request.env["omniauth.auth"])
#    if @user
#    	sign_in @user
#      redirect_to root_path
#    else
#     	redirect_to new_user_session_path, notice: 'Access Denied.'
#    end
#  end
#end 
  def google_oauth2
  # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "google_oauth2") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      set_flash_message(:notice, :failure, :kind => "Google", :reason => "It looks like you are already registered with the same email")
      redirect_to new_user_session_path
    end
  end
end