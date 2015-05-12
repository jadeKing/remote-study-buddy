class UsersController < ApplicationController
  def show
    @profile_user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to '/'
  end

  def user_params
    params.require(:user).permit(:bio)
  end
end
