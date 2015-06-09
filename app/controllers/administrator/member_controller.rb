class Administrator::MemberController < AdministratorsController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to :controller => "administrator/member", :action => "index"
    else
      render :action => 'add'
    end
  end

  def index
    @member = Member.order(:id => :desc).page(params[:page]).per(10) 
  end

  def show
    @transaction = Member.find params[:id]
  end

  def update
    @transaction = Member.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to :action => 'edit', :id => params[:id]
    else
        render :action => 'edit'
    end
  end

  def edit
    @member = Member.find params[:id]
  end

  def destroy
    @member=Member.find params[:id]
    @member.destroy
    flash[:success]="Deleted"
    redirect_to :controller => "administrator/member", :action => "index"
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end

end
