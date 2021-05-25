class UsersController < ApplicationController
  

  def index
    @users = current_user
  end

  def show
    @user = current_user
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:FirstName, :LastName, :role, :email)
  end
end
