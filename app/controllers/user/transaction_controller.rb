	class User::TransactionController < UsersController

		def index
			if Rails.env.development?
				@transaction = Transaction.where("member_id = ? AND strftime('%m', date) = ? ",current_member.id,DateTime.now.strftime("%m")).order(:id => :desc).page(params[:page]).per(10) 
				@tot_income=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
      			@tot_expense=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
      			@income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",1).order("date ASC").group("strftime('%m', date)")
      			@expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",2).order("date ASC").group("strftime('%m', date)")
			else
				
				@transaction = Transaction.where("member_id = ? AND EXTRACT(MONTH FROM date) = ? ",current_member.id,DateTime.now.strftime("%m")).order(:id => :desc).page(params[:page]).per(10) 
				@tot_income=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("id").first
      			@tot_expense=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("id").first
      			@income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",1).order("date ASC").group("EXTRACT(MONTH FROM date)")
      			@expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",2).order("date ASC").group("EXTRACT(MONTH FROM date)")
			end

			if @tot_income.nil? || @tot_income["tot"].nil?
				@tot_income={ "tot" =>0,
           		"id" => ""}
			end
			if @tot_expense.nil? || @tot_expense["tot"].nil?
				@tot_expense={ "tot" =>0,
           		"id" => ""}
			end
			mon= Array.new 
			inc= Array.new 
			exp=Array.new 
			bal=Array.new
			# Income per month
			
			@income.each do |i|
				mon << Date.parse(i["month"]).strftime("%b")
				inc << i["tot"]
			end
			@inc=inc.to_json.html_safe
			# Expense per month 
			
			@expense.each do |i|
				mon << Date.parse(i["month"]).strftime("%b")
				exp << i["tot"]
			end
			@exp=exp.to_json.html_safe
			
			@mon=mon.uniq
			balance=0
			arr_inc=0
			arr_exp=0
			@mon.each do |m|
				ind=@mon.index(m)
				arr_inc=inc[ind].present? ? inc[ind] : 0
				arr_exp=exp[ind].present? ? exp[ind] : 0					

				balance=arr_inc - arr_exp
				bal << balance
			end 
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