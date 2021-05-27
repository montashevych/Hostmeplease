class UserMailer < ApplicationMailer
  def new_user_email
    @user = params[:user]
    @admin_email = "kostp62020@gmail.com"
    mail(to: @admin_email, subject: "You got a new registration!")
  end
end
