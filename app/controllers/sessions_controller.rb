class SessionsController < ApplicationController
  before_action :check_user, only: %i(create)

  # Get Login
  def new
    @user = User.new
  end

  # Post Login
  def create
    log_in @user
    params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
    redirect_back_or @user
  end

  # Delete login or Logout User
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  # Check Email and Password user
  def check_user
    @user = User.find_by(email: params[:session][:email].downcase)
    return if @user&.authenticate(params[:session][:password])

    flash.now[:danger] = t "controller.sessions.check_user.flash_login_fail"
    render :new
  end
end
