class User::HomeController < UsersController
  def index
    require 'json'

  	# current_member["id"]
    @tot_income = Hash.new
    @tot_expense = Hash.new
  	@date = Date.today
  	if Rails.env.development?
	  	@income=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
      @tot_expense=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
  	else
  		@income=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("id").first
      @tot_expense=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("id").first
      if @tot_income.nil?
        @tot_income={ "tot" =>"",
           "id" => ""}
      end
      if @tot_expense.nil?
        @tot_expense{ "tot" =>"",
           "id" => ""}
      end
      
  	end
    
    
  end
end
