class Administrator::FaqController < AdministratorsController
  def index
    @faq = Faq.order(:id => :desc).page(params[:page]).per(10) 
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(faq_params)
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      redirect_to :controller => "administrator/faq", :action => "index"
    else
      render :action => 'add'
    end
  end

  def edit
    @faq = Faq.find params[:id]
  end

  def new
    @faq = Faq.new
  end

  def show
    @faq = Faq.find params[:id]
  end

  def destroy
    @faq=Faq.find params[:id]
    @faq.destroy
    flash[:success]="Deleted"
    redirect_to :controller => "administrator/faq", :action => "index"
  end

  private
  def faq_params
    params.require(:faq).permit(:title, :description,:order)
  end
end
