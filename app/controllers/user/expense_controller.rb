class User::ExpenseController < UsersController
  def new
  end

  def edit
  end

  def index
  	@expense = Expense.order(:id => :desc).page(params[:page]).per(10) 
  end
end
