class HomeController < ApplicationController
# respond_to :json
	def index
		# Email okanemanager@gmail.com
		# pass !qazxsw@
		# Twitter @okanemanager
		# Pass !qazxsw@
		# Google Plus https://plus.google.com/u/1/115652349374795853751/
		@contact=Contact.new
	end

	def contact
		@contact=Contact.new(contact_params)

		respond_to do |format|

			if @contact.save
			    # redirect_to :controller => "home", :action => "index"
			else
			    # render :action => 'index'
			end
			format.html { render :layout => false, :text => "success"}
		end
	end

	private
	def contact_params
	    params.require(:contact).permit(:name, :email,:message, :phone)
	end
	
end