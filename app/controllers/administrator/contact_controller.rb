class Administrator::ContactController < AdministratorsController
  def index
    @contact = Contact.order(:id => :desc).page(params[:page]).per(10) 
  end

  def new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to :controller => "administrator/contact", :action => "index"
    else
      render :action => 'add'
    end
  end

  def show
    @contact = Contact.find params[:id]
  end

  def destroy
    @contact=Contact.find params[:id]
    @contact.destroy
    flash[:success]="Deleted"
    redirect_to :controller => "administrator/contact", :action => "index"
  end

  def edit
    @contact = Contact.find params[:id]
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to :action => 'show', :id => @patient
    else
      render :action => 'edit'
    end
  end
end
