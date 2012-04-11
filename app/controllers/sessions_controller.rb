class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def before_save  
    self.updated_at = Time.now
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
       redirect_to user
	else 
	   sign_in_temp user	   
	   redirect_to user
	end
  end
end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
