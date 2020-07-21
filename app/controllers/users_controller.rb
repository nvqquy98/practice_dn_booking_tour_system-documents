class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(new create)
  before_action :check_user_edit, only: %i(edit update)
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params_create
    @user.user_contact.new
    if @user.save
      flash[:sucess] = "Register Sucess ! "
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params_edit)
      flash[:success] = "Information changed"
      redirect_to @user
    else
      flash[:danger] = "Check Information Please !"
      render :edit
    end
  end

  def edit; end

  private

  def user_params_create
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end

  def user_params_edit
    params.require(:user).permit(:name,:address,:phone_number,
                                 :password, :password_confirmation)
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = "User don't correct"
    redirect_to root_path
  end

  def check_user_edit
    return if current_user? @user

    redirect_to edit_user_path(@current_user)
  end
end
