class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      puts "user create success"
      login(user)
    else
      puts "user create failure"
      flash.now[:errors] = user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
