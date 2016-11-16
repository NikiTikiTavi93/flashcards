class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user =login(user_params[:email], user_params[:password], user_params[:remember_me])
    if @user
      redirect_to root_path, :notice => "Logged in!"
    else
      redirect_to login_path, :notice =>"Email or password incorrect"
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Logged out"
  end
  private
    def user_params
      params.require(:user).permit(:email, :password, :remember_me)
    end
end
