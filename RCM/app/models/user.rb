class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:google_oauth2]
    attr_writer :login

    def login
    	@login || self.username || self.email
  	end
  	
    validates :username, presence: :true, uniqueness: { case_sensitive: false }

    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

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


    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    

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
