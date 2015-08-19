class User::ExpenseController < UsersController
  def new
    @category=Category.all
  	@expense = Expense.new
  end

  def create
    params[:expense]["member_id"]=current_member["id"]
    @expense = Expense.new(expense_params)
    if @expense.save
        redirect_to :controller => "user/expense", :action => "index"
    else
      render :action => 'add'
    end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @category=Category.all
  	@expense = Expense.find params[:id]
  end

  def index
  	@expense = Expense.where("member_id = ? ",current_member["id"]).order(:id => :desc).page(params[:page]).per(10) 
  end

  def destroy
    @expense=Expense.find params[:id]
      @expense.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "user/expense", :action => "index"
  end

  private
  def expense_params
    params.require(:expense).permit(:name, :category_id,:date,:description,:member_id)
  end
end
