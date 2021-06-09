class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    redirect_to root_path
  end

  def show
    user_find
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
