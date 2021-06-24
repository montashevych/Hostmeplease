class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(email: from_google_email, params: from_google_params)
    if user.present?
      google_oauth2_success(user)
    else
      google_oauth2_failure
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    random_password = SecureRandom.hex(10)
    @from_google_params ||= {
      avatar_url: auth.info.image,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      password: random_password,
    }
  end

  def from_google_email
    @from_google_email ||= auth.info.email
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def google_oauth2_success(user)
    sign_out_all_scopes
    flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
    sign_in_and_redirect user, event: :authentication
  end

  def google_oauth2_failure
    flash[:alert] =
      t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{from_google_email} is not authorized."
    redirect_to new_user_session_path
  end
end
