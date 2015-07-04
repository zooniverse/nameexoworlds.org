class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token

  def developer
    @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Developer") if is_navigational_format?
    else
      set_flash_message(:notice, :failure, :kind => "Developer") if is_navigational_format?
    end

  end
end
