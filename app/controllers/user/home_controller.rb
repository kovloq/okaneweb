class User::HomeController < UsersController
  def index
  	current_member
  end
end
