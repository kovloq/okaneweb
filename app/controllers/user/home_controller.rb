class User::HomeController < UsersController
  def index
  	# current_member["id"]
  	@date = Date.today
  	if Rails.env.development?
	  	@income=Income.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? ",DateTime.now.strftime("%m"),current_member["id"]).group("category_id")
	  	@expense=Expense.select("COUNT(*) as total,category_id").where("strftime('%m', date) = ? AND member_id = ? ",DateTime.now.strftime("%m"),current_member["id"]).group("category_id")
  	else
  		@income=Income.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? ",DateTime.now.strftime("%m"),current_member["id"]).group("category_id")
	  	@expense=Expense.select("COUNT(*) as total,category_id").where("EXTRACT(MONTH FROM date) = ? AND member_id = ? ",DateTime.now.strftime("%m"),current_member["id"]).group("category_id")
  	end

  end
end
