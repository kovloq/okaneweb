class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    
    @member = Member.from_omniauth(request.env["omniauth.auth"])

    if @member.persisted?
      sign_in_and_redirect @member, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_url
    end
  end

  def twitter
    
    @member = Member.from_omniauth(request.env["omniauth.auth"].except("extra"))
    # puts request.env["omniauth.auth"].except("extra")
    if @member.persisted?
      # sign_in_and_redirect @member, :event => :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      # session["devise.twitter_data"] = request.env["omniauth.auth"].select { |k, v| k == "email" }
      redirect_to new_member_registration_url
    end
  end

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @member = Member.from_omniauth(request.env["omniauth.auth"])

    if @member.persisted?
      sign_in_and_redirect @member, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_url
    end
  end

end
