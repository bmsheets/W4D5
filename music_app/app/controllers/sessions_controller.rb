class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      login(user)
      # redirect_to
    else
      flash.now[:errors] = self.errors.full_messages
      render :new
    end
  end

  def destroy
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      logout(user)
    else
      flash.now[:errors] = self.errors.full_messages
      render :new
    end
  end
end
