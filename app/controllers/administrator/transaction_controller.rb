module Administrator
	class TransactionController < AdministratorsController

		def index
			@transaction = Transaction.order(:id => :desc).page(params[:page]).per(1) 
		end

		def show
			@transaction = Transaction.find params[:id]
			
		end

		def destroy
			@transaction="";
		end

		def create
			@transaction = Transaction.new(transaction_params)
		    if @transaction.save
		        redirect_to :controller => "administrator/transaction", :action => "index"
		    else
		      render :action => 'add'
		    end
		end

		def edit
		end

		def update
		end

		def new
			@transaction = Transaction.new
		end

		

		private

	  	def transaction_params
	    	params.require(:transaction).permit(:transaction_name, :category,:value, :created_by,:updated_by)
	  	end
	end
end