class TransactionController < AdministratorsController

	def index
		@transaction = Transaction.order(:id => :desc).page(params[:page]).per(1) 
		
		
	end

	def show
		@transaction = Transaction.find params[:id]
		
	end

	def create
		@transaction = Transaction.new(params[:transaction])
	    if @transaction.save
	        redirect_to @transaction, notice: "Successfully created."
	    else
	      render :action => 'add'
	    end
	end

	def new
		@transaction = Transaction.new
	end

	private

  	def transaction_params
    	params.require(:transaction).permit(:transaction_name, :category,:value, :created_by,:updated_by)
  	end
end