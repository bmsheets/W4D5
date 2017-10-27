class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to session_url
    else
      #??
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :session_token, :password_digest)
  end
end
