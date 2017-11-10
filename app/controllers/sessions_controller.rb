class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    if !session[:login_id].blank? && Login.where(id: session[:login_id]).any?
      redirect_to posts_url
    else
      session[:login_id] = nil
    end
  end

  def create
    session[:login_id] = nil

    login = Login.find_by(username: params[:username].strip)
    if login && login.authenticate(params[:password].strip)
      session[:login_id] = login.id
      redirect_to posts_url
    else
      redirect_to new_session_url, alert: 'Invalid login/password combination'
    end
  end

  def destroy
    session[:login_id] = nil
    redirect_to root_url
  end
end
