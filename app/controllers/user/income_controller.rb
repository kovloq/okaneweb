class User::IncomeController < UsersController
  def new
    @category=Category.where("tipe = ? ",1);
  	@income = Income.new
  end

  def create
    params[:income][:member_id]=current_member["id"]
    @income = Income.new(income_params)
    
    if @income.save
        redirect_to :controller => "user/income", :action => "index"
    else
      render :action => 'add'
    end
  end

  def update
    @income = Income.find(params[:id])
    if @income.update_attributes(income_params)
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @category=Category.where("tipe = ? ",1);
  	@income = Income.find params[:id]
  end

  def index
  	@income = Income.where("member_id = ? ",current_member["id"]).order(:id => :desc).page(params[:page]).per(10) 
  end

  def destroy
    @income=Income.find params[:id]
      @income.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "user/income", :action => "index"
  end

  private
  def income_params
    params.require(:income).permit(:name, :category_id,:date,:description,:member_id,:amount)
  end
end
