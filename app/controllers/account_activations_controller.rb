class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])

    if user && user.activated?
      flash[:info] = "You have already activated"
      return redirect_to login_url
    end

    if user && user.check_activation_token(params[:id])
      user.activate
      auto_login(user)
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_path
    end
  end
end
