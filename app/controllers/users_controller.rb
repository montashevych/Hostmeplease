class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_find, only: [:show]

  def index
    redirect_to root_path
  end

  def show; end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
