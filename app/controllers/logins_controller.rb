class LoginsController < ApplicationController
  before_action :set_login, only: [:edit, :update, :destroy]
  respond_to :html
  responders :flash

  def index
    @logins = Login.all
    respond_with @logins
  end

  def new
    @login = Login.new
  end

  def edit
  end

  def create
    @login = Login.new(login_params)
    @login.save
    respond_with @login, location: posts_url
  end

  def update
    @login.update(login_params)
    respond_with @login
  end

  def destroy
    @login.destroy
    respond_with @login
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.require(:login).permit(:username, :password, :password_confirmation)
    end
end
