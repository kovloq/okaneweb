class User::RegistrationController < Devise::RegistrationsController
  respond_to :json
  def create
  	super
  end

  def new
  	super
  end
end
