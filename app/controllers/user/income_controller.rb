class User::IncomeController < UsersController
  def new
  	@income = Income.new
  end

  def create
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
  	@income = Income.find params[:id]
  end

  def index
  	@income = Income.order(:id => :desc).page(params[:page]).per(10) 
  end

  def destroy
    @income=Income.find params[:id]
      @income.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "user/income", :action => "index"
  end

  private
  def income_params
    params.require(:income).permit(:name, :category_id,:date,:description)
  end
end
