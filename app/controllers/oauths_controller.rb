class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(params[:provider])
  end

  def callback(provider = nil)
    provider = provider || params[:provider]
    debugger
    if @user = login_from(provider)
      redirect_to root_path, :success => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        @user.activate!

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to user_path(@user), :success => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :danger => "Failed to login from #{provider.titleize}!"
      end
    end
  end

  def vkontakte
    callback("vk")
  end

  private

  def oauth_params
    params.require(:provider).permit(:vk, :facebook)
  end
end
