class Administrator::CategoryController < AdministratorsController
  def new
    @category = Category.new
  end

  def create
    
    @category = Category.new(category_params)
    if @category.save
        redirect_to :controller => "administrator/category", :action => "index"
    else
      render :action => 'add'
    end
  end

  def index
    @category = Category.order(:id => :desc).page(params[:page]).per(10) 
  end

  def show
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def destroy
    @category=Category.find params[:id]
      @category.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "administrator/category", :action => "index"
  end

  private
  def category_params
    params.require(:category).permit(:name, :color,:tipe)
  end
end
