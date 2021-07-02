class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_find, only: [:show, :edit]

  def index
    redirect_to root_path
  end

  def show; end

  def edit; end

  def update
    user_find
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :first_name, :last_name, :email, :phone_number, :full_number, :password,
                                 :password_confirmation)
  end
end
