class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_find, only: [:show, :edit, :update]

  def index
    redirect_to root_path
  end

  def show
    @user_form = UserForm.new(user: @user)
  end

  def edit
    @user_form = UserForm.new(user: @user)
  end

  def update
    @user_form = UserForm.new(user: current_user, **user_params)
    @user_form.submit
    if @user_form.success
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user_form).permit(:first_name,
                                      :last_name,
                                      :role,
                                      :email,
                                      :phone_number)
  end
end
