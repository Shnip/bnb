class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(session_params[:email], session_params[:password], session_params[:remember_me])
      if @user.activated?
        flash[:success] = 'Login successful'
        redirect_back_or_to(user_path(@user))
      else
        flash[:danger] = "Yout account is not activated.
                          Please check your email for the activation link"
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, flash: {success: 'Logged out!'})
  end

  private

    def session_params
      params.require(:user_session).permit(:email, :password, :remember_me)
    end
end
