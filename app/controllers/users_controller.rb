class UsersController < ApplicationController
  before_action :find_user, only: [:update, :show, :edit]
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_current_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        login(@user.email, params[:user][:password], false)
        redirect_to root_path, :notice => t('flash_messages.user.reg_user')
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
      redirect_to root_path, :notice => t('flash_messages.user.update_user')
    else
      render 'edit'
    end
  end

  private
    def set_current_user
      @user = current_user
    end

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :locale)
    end
end
