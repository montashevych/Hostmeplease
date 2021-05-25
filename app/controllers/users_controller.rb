class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user
  end

  def show
  end

  def destroy
    user_find
    @user.destroy!
    redirect_to users_path
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:FirstName, :LastName, :role, :email)
  end
end
