class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook,:twitter,:google_oauth2]
# :validatable,
	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
	    member.email = auth.info.email
	    member.password = Devise.friendly_token[0,20]
	    member.name = auth.info.name   # assuming the user model has a name
	    member.image = auth.info.image # assuming the user model has an image
	    
	  end
	end

	def self.new_with_session(params,session)
	    if session["devise.user_attributes"]
	      new(session["devise.user_attributes"],without_protection: true) do |member|
	        member.attributes = params
	        member.valid?
	      end
	    else
	      super
	    end
  	end

   	protected
	def confirmation_required?
  		false
	end
end
