class Members::RegistrationsController < Devise::RegistrationsController
  # respond_to :json
  # layout false
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  require 'net/http'
  # POST /resource
  def create
    
    super
    if current_member.provider.nil?
      gravatar_id = Digest::MD5::hexdigest(current_member.email).downcase
      gravatar_check = "http://gravatar.com/avatar/#{gravatar_id}.png?d=404"
      
      # CHeck if gravatar exist
      uri = URI.parse(gravatar_check)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      if (response.code.to_i != 404)
        url="https://secure.gravatar.com/avatar/#{gravatar_id}.png"
        @member= Member.find_by_email(current_member.email)
        @member.update_attribute(:image,url)
      end
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end
end
