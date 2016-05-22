class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #do something
      flash[:success] = "Welcome to the alpha blog, #{@user.username}!"
      redirect_to articles_path
    else
      #if there is an error, render new template again
      render 'new'
    end
  end
  
  
  def edit
    # get current user 
    @user = User.find(params[:id])
  end
  
  def update
      # get current user 
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to articles_path
      else
        render 'edit'
      end
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end