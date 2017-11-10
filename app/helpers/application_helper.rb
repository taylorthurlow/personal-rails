module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def current_user
    return Login.find(session[:login_id]) if session[:login_id]
    return nil
  end

  def authenticated?
    return !session[:login_id].blank? && Login.where(id: session[:login_id]).any?
  end
end
