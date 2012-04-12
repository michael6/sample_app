class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
 

def create
  user = User.authenticate(params[:session][:email],
                           params[:session][:password])
  if user.nil?
    flash.now[:error] = "Invalid email/password combination."
    @title = "Sign in"
    render 'new'
  else
    if( params[:remember_token]=="1")
       sign_in user
	   user.touch	
       redirect_to user
	   
	else 
	   sign_in_temp user	
         user.touch	
	  redirect_to user
	 
	end
  end
end
  
  def destroy
    sign_out
    redirect_to root_path
	
  end
end
