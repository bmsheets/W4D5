class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def login(user)
  end

  def logout(user)
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end
end
