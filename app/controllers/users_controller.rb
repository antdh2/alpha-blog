class UsersController < ApplicationController
  # this calls the set_user method on the defined methods as first line of code in method
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin , only: [:destroy]
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #do something
      flash[:success] = "Welcome to the alpha blog, #{@user.username}!"
      redirect_to user_path(@user)
    else
      #if there is an error, render new template again
      render 'new'
    end
  end
  
  
  def edit
    # get current user 
  end
  
  def update
      # get current user 
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to articles_path
      else
        render 'edit'
      end
  end
  
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by have been deleted"
    redirect_to users_path
  end
  
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only administrators can perform that action"
      redirect_to root_path
    end
  end
end