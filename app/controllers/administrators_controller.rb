class AdministratorsController < ApplicationController
	layout 'dashboard'
	# before_filter :authorize
	# user = admin
	# pass = admin
	def authorize
		if session[:admin_name]==nil
			redirect_to :controller=>"administrator/login",:action=>"index"
		end
	end
end
