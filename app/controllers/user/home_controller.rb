class User::HomeController < UsersController
  def index
    require 'json'

  	# current_member["id"]
    @ses=current_member
    @tot_income = Hash.new
    @tot_expense = Hash.new
  	@date = Date.today
  	
  	@income=Transaction.where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).group("category_id")
  	@expense=Transaction.where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).group("category_id")
    @tot_income=Transaction.select("SUM(amount) as tot").where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],1).first
    @tot_expense=Transaction.select("SUM(amount) as tot").where("MONTH(date) = ? AND member_id = ? AND t_category = ? ",DateTime.now.strftime("%m"),current_member["id"],2).first
  	
    
  end
end
