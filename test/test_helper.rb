require 'simplecov'

unless ENV['NO_COVERAGE']
  SimpleCov.start :rails do
    add_filter '/vendor/assets'
    add_filter '/vendor/ruby'
  end
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login_as(login)
    session[:login_id] = logins(login).id
  end

  def logout
    session.delete :login_id
  end
end
