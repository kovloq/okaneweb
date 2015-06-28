class Administrator::LoginController < ApplicationController
  def index
  	@admin=Admin.new
    @password=Digest::SHA1.hexdigest("admin");
  	render :layout => false
  end

  def login
  	username=params[:admin][:username];
  	password=Digest::SHA1.hexdigest(params[:admin][:password]);
  	cek=Admin.where('username = ? AND password = ?',username , password).first()
  	# puts cek.to_sql
  	if(cek)
  		session[:id_admin] = cek[:id]
  		session[:admin_name] = cek[:name]
  		session[:admin_email]=cek[:email]
  		# flash[:success] = "Valid"
  		
  		redirect_to :controller => "administrator/home", :action => "index"
  	else
  		flash[:danger] = "Invalid Username or Password"
  		redirect_to :controller => "administrator/login", :action => "index"
  	end

  	# render :layout => false
  end

  def logout
  	# session[:id_admin] = nil
  	# 	session[:admn_name] = nil
  	# 	session[:admin_email]=nil
  	session.delete(:id_admin);
  	session.delete(:admin_name);
  	session.delete(:admin_email);
  	redirect_to :controller => "administrator/login", :action => "index"
  end

end
