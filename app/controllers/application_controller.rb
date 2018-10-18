class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  include ApplicationHelper

  private

  def authorize
    return if authenticated?
    redirect_to new_session_url, method: :delete, notice: 'Please log in'
  end
end
