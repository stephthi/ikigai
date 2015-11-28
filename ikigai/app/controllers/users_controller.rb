class UsersController < ApplicationController
  before_action :ensure_logged_in, only:[:show]

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '../sessions/new', notice: "Signed Up!"
    else
      render "new"
    end
  end


  def show
    @user = current_user
  end

private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
