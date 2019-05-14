class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:google_oauth2]

    has_many :authorizations

    # omniauth facebook provider
    def self.from_omniauth(auth, current_user)
        # check for existing authorization
        # Find or create Authorization with: provider, uid, token and secret
    authorization = Authorization.where(
      :provider => auth.provider, 
      :uid => auth.uid.to_s, 
      :token => auth.credentials.token, 
      :secret => auth.credentials.secret
    ).first_or_initialize

    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user

      # save user related data in user table
      if user.blank?
        User.new(
          :email            => auth.info.email,
          :password         => Devise.friendly_token[0,10],
          :name             => auth.info.name,
          :locations        => auth.info.location,
          :image_url        => auth.info.image
        )
        # since twitter don't provide email, 
        # so you need to skip validation for twitter.
        auth.provider == "twitter" ?  user.save!(:validate => false) :  user.save!
      end

      # store authorization related data in authorization table
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save!
    end
    authorization.user
  end
end
