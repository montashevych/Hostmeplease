class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    user_find
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.with(user: @user).new_user_email.deliver_later

      flash[:success] = t('flash.user.success')
      redirect_to @user
    else
      flash.now[:error] = t ('flash.user.error_html')
      render :new
  end
end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :FirstName, :LastName, :role, :email, :message, :password, :password_confirmation )
  end
end
