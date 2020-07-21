class Admin::ApplicationController < ActionController::Base
  layout "admin"
  include SessionsHelper

  before_action :require_admin

  def home; end
  private
  def require_admin
    return current_user&.supervisor?

    flash[:danger] = "Pages don't not exist !"
    redirect_to root_path
  end
end
