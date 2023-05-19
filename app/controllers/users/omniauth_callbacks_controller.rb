class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # FOR TUTORIAL 1
  def google_oauth2
    user = User.from_google(from_google_params)

    if user.present?
      sign_out_all_scopes
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  # FOR TUTORIAL 2
  # def google_oauth2
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #     set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #   end
  # end

  # GITHUB
  def github
    @user = User.from_github(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'GitHub') if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

  # FACEBOOK
  def facebook
    @user = User.from_github(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

  # LINKEDIN
  def linkedin
    @user = User.from_github(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Linkedin') if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end
end