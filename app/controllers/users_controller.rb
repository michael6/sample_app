class UsersController < ApplicationController
  before_filter :authenticate, :only => [ :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def show
    if signed_in?
	  @user = User.find(params[:id])
	  @title = @user.name
	else
	  if(User.find(params[:id]).public) 
        @user = User.find(params[:id])
        @title = @user.name
      else
	    deny_access
	  end
	end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
	@title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."     	  
      redirect_to @user	  
	else
      @title = "Edit user"
      render 'edit'
    end
	
  end
  
   def index
    
	if signed_in?
	   @title = "All users"
	   @users = User.all
	else
	   @title = "All public users"
	   @users = User.find_all_by_public(true)
	end
	@users = @users.paginate(:page => params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
	flash[:success] = "User destroyed."
	redirect_to users_path
  end
  
  private
    def authenticate
      deny_access unless signed_in?
    end
	
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user? (@user)
	end
	
	def admin_user
	  redirect_to(root_path) unless current_user.admin?
	end
end
