ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as( user )
    cookies[:auth_token] = users(user).auth_token
  end

  def logout
    cookies.delete( :auth_token )
  end

  def setup
    login_as :one if defined? cookies
  end
end
