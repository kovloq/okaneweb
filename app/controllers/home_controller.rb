class HomeController < ApplicationController

	def index
		# Email okanemanager@gmail.com
		# pass !qazxsw@
		# Twitter @okanemanager
		# Pass !qazxsw@
		# Google Plus https://plus.google.com/u/1/115652349374795853751/
	end

	def contact
		@contact=Contact.new(contact_params)
		if @contact.save
		    redirect_to :controller => "home", :action => "index"
		else
		    render :action => 'index'
		end
	end

	def transaction_params
	    params.require(:contact).permit(:name, :email,:message, :phone)
	end
	
end