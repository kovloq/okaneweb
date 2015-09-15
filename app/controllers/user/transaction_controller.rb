	class User::TransactionController < UsersController

		def index
			mon= Array.new 
			inc= Array.new 
			exp=Array.new 
			bal=Array.new
			
			
			
			@all= Transaction.where("member_id = ? ",current_member.id).order("date ASC").group("MONTH(date)")
			@transaction = Transaction.where("member_id = ? AND MONTH(date) = ? ",current_member.id,DateTime.now.strftime("%m")).order(:id => :desc).page(params[:page]).per(10) 
			@tot_income=Transaction.select("SUM(amount) as tot").where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
  			@tot_expense=Transaction.select("SUM(amount) as tot").where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
  			# Get all month
  			@all.each do |a|
  				mon << a["date"].strftime("%b")
				# if(a["t_category"]==1)
					# Get all income per month
					@income=Transaction.select("SUM(amount) as tot").where("t_category = ? AND MONTH(date) = ? ",1,a["date"].strftime("%m")).order("date ASC").first
					income = @income["tot"].present? ? @income["tot"] : 0
				# else
					# Get all expense per month
					@expense=Transaction.select("SUM(amount) as tot").where("t_category = ? AND MONTH(date) = ? ",2,a["date"].strftime("%m")).order("date ASC").first
					expense = @expense["tot"].present? ? @expense["tot"] : 0
				# end
				balance=income - expense
				bal << balance
				inc << income
				exp << expense
			end
			
			if @tot_income["tot"].blank?
				@tot_income={"tot"=>0}
			end	
			if @tot_expense["tot"].blank?
				@tot_expense={"tot"=>0}
			end

			if @transaction.present?
				@tmp=@transaction.first
				@month=@tmp["date"].strftime("%B")
			else
				@month=DateTime.now.strftime("%B")
			end
					
			@mon=mon.to_json.html_safe	
			@inc=inc.to_json.html_safe
			# Expense per month 
			
			@exp=exp.to_json.html_safe
			
			@bal=bal.to_json.html_safe
			# "#{@tot_income['tot'] - @tot_expense['tot']}"
			@balance=@tot_income['tot'] -  @tot_expense['tot']
			
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