class User::HomeController < UsersController
  def index
    require 'json'

  	# current_member["id"]
  	@date = Date.today
  	if Rails.env.development?
	  	@income=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1)..to_sql
      @tot_expense=Transaction.select("SUM(amount) as tot").where("strftime('%m', date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
  	else
  		@income=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
	  	@expense=Transaction.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
      @tot_income=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("id").to_sql
      @tot_expense=Transaction.select("SUM(amount) as tot,id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("id").first

      
  	end
    
    
  end
end
