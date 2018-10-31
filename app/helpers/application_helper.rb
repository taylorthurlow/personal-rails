module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def title(page_title)
    content_for(:title) { "#{page_title} - Taylor Thurlow" }
  end

  def current_user
    return Login.find(session[:login_id]) if session[:login_id]
    return nil
  end

  def authenticated?
    return !session[:login_id].blank? && Login.where(id: session[:login_id]).any?
  end
end
