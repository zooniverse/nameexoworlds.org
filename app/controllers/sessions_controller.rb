class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:uid] = @user.uid
    redirect_to '/'
  end

  def destroy
    session[:uid] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
