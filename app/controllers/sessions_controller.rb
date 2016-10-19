class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user =login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to root_path, :notice => "Logged in!"
    else
      redirect_to login_path, :notice =>"Email or password incorrect"
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Logged out"
  end
end
