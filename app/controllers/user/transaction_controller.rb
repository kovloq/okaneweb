	class User::TransactionController < UsersController

		def index
			sql="select * from incomes, expenses WHERE incomes.member_id='22' AND expenses.member_id='22'"
			@test=ActiveRecord::Base.connection.execute(sql)
			@transaction = Transaction.where("member_id = ?",current_member.id).order(:id => :desc).page(params[:page]).per(10) 
		end

		def show
			@transaction = Transaction.find params[:id]
			
		end

		def destroy
			@transaction=Transaction.find params[:id]
			@transaction.destroy
			flash[:success]="Deleted"
			redirect_to :controller => "user/transaction", :action => "index"
		end

		def create
			@transaction = Transaction.new(transaction_params)
		    if @transaction.save
		        redirect_to :controller => "user/transaction", :action => "index"
		    else
		      render :action => 'add'
		    end
		end

		def edit
			@transaction = Transaction.find params[:id]
		end

		def update
			@transaction = Transaction.find(params[:id])
		    if @transaction.update_attributes(params[:transaction])
		     redirect_to :action => 'edit', :id => params[:id]
		    else
		     render :action => 'edit'
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