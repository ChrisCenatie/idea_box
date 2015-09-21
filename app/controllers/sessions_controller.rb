class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      user_path
    else
      flash.now[:error] = "Username or Password is Incorrect."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def user_path
    if @user.admin?
      redirect_to admin_categories_path
    else
      redirect_to user_categories_path
    end
  end

end
