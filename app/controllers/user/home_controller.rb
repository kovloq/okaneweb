class User::HomeController < UsersController
  def index
  	# current_member["id"]
  	@date = Date.today
  	if Rails.env.development?
	  	@income=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
      @tot_expense=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
  	else
  		@income=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(CAST(amount)) as tot").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1)
      @tot_expense=Transaction.select("SUM(CAST(amount)) as tot").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2)
  	end
    
    
  end
end
