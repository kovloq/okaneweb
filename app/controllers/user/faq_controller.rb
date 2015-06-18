class User::FaqController < UsersController
  def show
  	@faq = Faq.order(:order => :asc)
  end
end
