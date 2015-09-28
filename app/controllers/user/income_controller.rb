class User::IncomeController < UsersController
  def new
    @category=Category.where("tipe = ? ",1);
  	@transaction= Transaction.new
  end

  def create
    params[:transaction][:member_id]=current_member["id"]
    params[:transaction][:t_category]=1
    params[:transaction][:amount]=params[:transaction][:amount].gsub! ',', ''

    @transaction = Transaction.new(transaction_params)
    
    if @transaction.save
        redirect_to :controller => "user/income", :action => "index"
    else 
      @category=Category.where("tipe = ? ",1);
      render :action => 'new'
    end
  end

  def update
    params[:transaction][:amount]=params[:transaction][:amount].gsub! ',', ''
    # puts params[:transaction][:amount]
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @category=Category.where("tipe = ? ",1);
  	@transaction = Transaction.find params[:id]
  end

  def index
  	@transaction = Transaction.where("member_id = ? AND t_category = ? ",current_member["id"],1).order(:id => :desc).page(params[:page]).per(10) 
  end

  def destroy
    @transaction=Transaction.find params[:id]
      @transaction.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "user/income", :action => "index"
  end

  private
  def transaction_params
    params.require(:transaction).permit(:name, :category_id,:date,:description,:member_id,:amount,:t_category)
  end
end
