class Administrator::AdminController < AdministratorsController
  def new
    @admin = Admin.new
  end

  def create
    params[:admin][:password]=Digest::SHA1.hexdigest(params[:admin][:password]);
    @admin = Admin.new(admin_params)
    if @admin.save
        redirect_to :controller => "administrator/admin", :action => "index"
    else
      render :action => 'add'
    end
  end

  def index
    @admin = Admin.order(:id => :desc).page(params[:page]).per(10) 
  end

  def show
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def destroy
    @admin=Admin.find params[:id]
      @admin.destroy
      flash[:success]="Deleted"
      redirect_to :controller => "administrator/admin", :action => "index"
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :name,:password)
  end
end
