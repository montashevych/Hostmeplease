# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_user_email
    # Set up a temporary user for the preview
    user = User.new(FirstName: 'Ivan', LastName: 'Bogun', email: 'ivan@gmail.com', message: 'I want to log in!')

    UserMailer.with(user: user).new_user_email
  end
end
