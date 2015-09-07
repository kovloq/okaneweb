class User::SettingController < UsersController
  def show
  end

  def update

  	@profile=Member.find(current_member.id)
  	@profile.skip_reconfirmation!
  	if @profile.update_attributes(member_params)
      redirect_to :action => 'profile'
    else
      render :action => 'profile'
    end
  end

  def profile
  	@profile=Member.find(current_member.id)
  end

  def delete
  end

  def password
  	@profile=current_member

  end

  def update_password
  	@profile=Member.find(current_member.id)
  	if @profile.update_with_password(member_params)
	  	sign_in @profile, :bypass => true
	  	flash[:success]="Your password has been updated"
	  	redirect_to :action => 'password'
	else
		render :action => 'password'
  	end
  end

  def delete_member
  	#delete table member
  	member=Member.find(current_member.id)
  	member.destroy
  	# Delete transaction
  	transaction=Transaction.where("member_id = ? ",current_member.id).destroy_all
  	# transaction.destroy
  	flash[:notice]=""
  	redirect_to new_member_registration_url
  end

  private
  def member_params
    params.require(:member).permit(:email, :name,:password, :password_confirmation, :current_password)
  end

  def confirmation_required?
  		false
	end

end
