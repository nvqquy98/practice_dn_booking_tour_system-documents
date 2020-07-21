class Admin::UsersController < Admin::ApplicationController
  include Admin::ApplicationHelper

  before_action :load_user, except: %i(index)

  def index
    @users = User.paginate page: params[:page]
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = "Information chaged"
      redirect_to @user
    else
      flash[:danger] = "Check Information User Please !"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User Deleted"
    else
      flash[:danger] = "User don't exist !"
    end
    redirect_to admin_users_path
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = "User don't exits"
    redirect_to admin_user_path
  end

  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :password, :password_confirmation)
  end
end
