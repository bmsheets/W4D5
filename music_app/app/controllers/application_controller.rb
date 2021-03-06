class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def login(user)
    session[:session_token] = user.reset_session_token
    redirect_to user_url(user)
  end

  def logout(user)
    user.reset_session_token
    session[:session_url] = nil
    redirect_to new_session_url
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
