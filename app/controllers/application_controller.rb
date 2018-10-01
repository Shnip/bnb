class ApplicationController < ActionController::Base
  before_action :require_login

  include UserSessionsHelper 

  private
    def not_authenticated
      redirect_to login_path, flash: {danger: "Please login first"}
    end
end
