ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  #include Sorcery::TestHelpers::Rails::Controller
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login_user(user, options = {})
    # post the login and follow through
    remember_me = options[:remember_me] || "0"
    post "/user_sessions", params: {user_session: { email: user.email,
      password: 'password', remember_me: remember_me }}
    follow_redirect!
  end
  # Add more helper methods to be used by all tests here...
end
