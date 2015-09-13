	class User::TransactionController < UsersController

		def index
			mon= Array.new 
			inc= Array.new 
			exp=Array.new 
			bal=Array.new
			@tot_expense={"tot"=>0}
			@tot_income={"tot"=>0}
			if Rails.env.development?
				@all= Transaction.where("member_id = ? ",current_member.id).order("date ASC").group("strftime('%m', date)")
				@transaction = Transaction.where("member_id = ? AND strftime('%m', date) = ? ",current_member.id,DateTime.now.strftime("%m")).order(:id => :desc).page(params[:page]).per(10) 
				@tot_income=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
      			@tot_expense=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
      			# Get all month
      			@all.each do |a|
      				mon << a["date"].strftime("%b")
					# if(a["t_category"]==1)
						# Get all income per month
						@income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? AND strftime('%m', date) = ? ",1,a["date"].strftime("%m")).order("date ASC").first
						income = @income["tot"].present? ? @income["tot"] : 0
					# else
						# Get all expense per month
						@expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? AND strftime('%m', date) = ? ",2,a["date"].strftime("%m")).order("date ASC").first
						expense = @expense["tot"].present? ? @expense["tot"] : 0
					# end
					balance=income - expense
					bal << balance
					inc << income
					exp << expense
				end
				# puts @all.to_sql
      			# @income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",1).order("date ASC").group("strftime('%m', date)")
      			# @expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",2).order("date ASC").group("strftime('%m', date)")
			else
				
				@all= Transaction.where("member_id = ? ",current_member.id).order("date ASC").group("date_trunc('month', date)","id")
				@transaction = Transaction.where("member_id = ? AND EXTRACT(MONTH FROM date) = ? ",current_member.id,DateTime.now.strftime("%m")).order(:id => :desc).page(params[:page]).per(10) 
				income_loop=Transaction.select("SUM(amount) as tot").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("id")
				income_loop.each do |s|
					@tot_income["tot"]=@tot_income["tot"] + s["tot"]
				end
      			expense_loop=Transaction.select("SUM(amount) as tot").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("id")
      			expense_loop.each do |s|
      				@tot_expense["tot"]=@tot_expense["tot"] + s["tot"]
      			end
      			# Get all month
      			@all.each do |a|
      				mon << a["date"].strftime("%b")
					# if(a["t_category"]==1)
						# Get all income per month
						@income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? AND EXTRACT(MONTH FROM date) = ? ",1,a["date"].strftime("%m")).order("date ASC").group("date_trunc('month', date)","id").first
						income = @income["tot"].present? ? @income["tot"] : 0
					# else
						# Get all expense per month
						@expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? AND EXTRACT(MONTH FROM date) = ? ",2,a["date"].strftime("%m")).order("date ASC").group("date_trunc('month', date)","id").first
						expense = @expense["tot"].present? ? @expense["tot"] : 0
					# end
					balance=income - expense
					bal << balance
					inc << income
					exp << expense
				end
      			# @income=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",1).order("date ASC").group("EXTRACT(MONTH FROM date)")
      			# @expense=Transaction.select("SUM(amount) as tot,date as month").where("t_category = ? ",2).order("date ASC").group("EXTRACT(MONTH FROM date)")
			end

			if @tot_income.nil? || @tot_income["tot"].nil?
				@tot_income={ "tot" =>0,
           		"id" => ""}
			end
			if @tot_expense.nil? || @tot_expense["tot"].nil?
				@tot_expense={ "tot" =>0,
           		"id" => ""}
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