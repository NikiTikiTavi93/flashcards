class UsersController < ApplicationController
  before_action :find_user, only: [:update, :show, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        login(@user.email, params[:user][:password], false)
        redirect_to root_path, :notice => "You are registered now!"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path, :notice => "Profile update"
    else
      render 'edit'
    end
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
