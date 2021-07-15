module ApplicationHelper
  def admin?
    false
  end

  def test_registration
    visit new_user_registration_path
    fill_in 'First name', with: test_user.first_name
    fill_in 'Email', with: test_user.email
    fill_in 'Password', with: test_user.password
    fill_in 'Password confirmation', with: test_user.password_confirmation
    click_button 'Sign Up'
  end

  def test_confirmation
    visit root_path
    usr = User.find_by email: test_user.email
    raw, enc = Devise.token_generator.generate(usr.class, :confirmation_token)
    usr.confirmation_token = enc
    usr.confirmation_sent_at = Time.now.utc
    usr.save(validate: false)
    visit "/users/confirmation?confirmation_token=#{raw}"
  end

  def test_login
    visit user_session_path
    fill_in 'Email', with: test_user.email
    fill_in 'Password', with: test_user.password
    click_button 'Sign In'
  end

  def test_edit_form
    fill_in 'user_form[first_name]', with: test_user.first_name
    fill_in 'user_form[last_name]', with: test_user.last_name
    fill_in 'user_form[email]', with: test_user.email
    fill_in 'user_form[phone_number]', with: test_user.phone_number
    click_button 'Save Changes'
  end
end
