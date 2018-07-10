class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:login][:username])
    if user && user.authenticate(params[:login][:password])

    else
      flash.now[:danger] = 'Invalid'
      render 'new'
    end
  end

  def destroy
  end

end
