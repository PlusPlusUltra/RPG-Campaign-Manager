class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:google_oauth2],
        authentication_keys: [:login]
    
    attr_accessor :login

    def login
      @login || self.email || self.username
    end

    validates :email, uniqueness: true
    validates :username, uniqueness: { case_sensitive: false }

    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["username = :value OR email = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    def self.generate_username(fullname)
      ActiveSupport::Inflector.transliterate(fullname) # change ñ => n
        .downcase              # only lower case
        .strip                 # remove spaces around the string
        .gsub(/[^a-z]/, '_')   # any character that is not a letter or a number will be _
        .gsub(/\A_+/, '')      # remove underscores at the beginning
        .gsub(/_+\Z/, '')      # remove underscores at the end
        .gsub(/_+/, '_')       # maximum an underscore in a row
    end

    def self.find_unique_username(username)
      taken_usernames = User
        .where("username LIKE ?", "#{username}%")
        .pluck(:username)

      # username if it's free
      return username if ! taken_usernames.include?(username)

      count = 2
      while true
        # username_2, username_3...
        new_username = "#{username}_#{count}"
        return new_username if ! taken_usernames.include?(new_username)
        count += 1
      end
    end
    
    def self.from_omniauth(auth)
      un = generate_username(auth.info.name);
      un = find_unique_username(un);
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.username = un;
      end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end

  end
end
