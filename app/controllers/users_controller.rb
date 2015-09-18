class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:status] = "Account Successfully Created"
      redirect_to login_path
    elsif params_missing?
      flash.now[:error] = "Please Complete Required Fields"
      render :new
    else
      flash.now[:error] = "Username is Invalid"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def params_missing?
    false
    if params[:user][:username] == "" || params[:user][:password] == ""
      true
    end
  end
end
