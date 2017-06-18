module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def current_user
    if session[:login_id]
      return Login.find(session[:login_id])
    end
    return nil
  end

  def is_authenticated?
    if not session[:login_id].blank? and Login.where(id: session[:login_id]).any?
      return true
    end
    return false
  end

end
