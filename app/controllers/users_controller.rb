class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_find, only: [:show, :bookings]

  BOOKINGS_PER_PAGE = 9

  def index
    redirect_to root_path
  end

  def show; end

  def bookings
    @bookings = @user.bookings.where(cancelled: false).paginate(page: params[:page], per_page: BOOKINGS_PER_PAGE)
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
