class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:google_oauth2]

    def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    		user.provider = auth.provider
    		user.uid = auth.uid
    		user.email = auth.info.email
    		user.name = auth.info.name
    		user.password = Devise.friendly_token[0,20]
    		user.save!
    	end
    end

    

end
