class TransactionController < ApplicationController

	def index
		@transaction = Transaction.order(:id => :desc).page(params[:page]).per(1) 
		render :layout => 'dashboard'
	end

	def show
		@transaction = Transaction.find params[:id]
		render :layout => 'dashboard'
	end

	def create
		@transaction = Transaction.new(params[:transaction])
	    if @transaction.save
	        redirect_to @transaction, notice: "Successfully created."
	    else
	      render :action => 'add'
	      ender :layout => 'dashboard'
	    end
	end

	def new
		@transaction = Transaction.new
		render :layout => 'dashboard'
	end

	private

  	def transaction_params
    	params.require(:transaction).permit(:transaction_name, :category,:value, :created_by,:updated_by)
  	end
end