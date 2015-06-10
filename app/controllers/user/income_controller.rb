class User::IncomeController < UsersController
  def new
  end

  def edit
  end

  def index
  	@income = Income.order(:id => :desc).page(params[:page]).per(10) 
  end
end
