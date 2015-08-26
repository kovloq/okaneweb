class User::ExpenseController < UsersController
  def new
    @category=Category.where("tipe = ? ",2);
  	@transaction = Transaction.new
  end

  def create
    params[:transaction][:member_id]=current_member["id"]
    params[:transaction][:t_category]=2
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
        redirect_to :controller => "user/expense", :action => "index"
    else
      render :action => 'add'
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @category=Category.where("tipe = ? ",2);
  	@transaction = Transaction.find params[:id]
  end

  def index
  	@transaction = Transaction.where("member_id = ? AND t_category = ? ",current_member["id"],2).order(:id => :desc).page(params[:page]).per(10) 
  end

  def destroy
    @transaction=Transaction.find params[:id]
      @transaction.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "user/expense", :action => "index"
  end

  private
  def transaction_params
    params.require(:transaction).permit(:name, :category_id,:date,:description,:member_id,:amount,:t_category)
  end
end
