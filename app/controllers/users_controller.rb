class UsersController < ApplicationController
  def show
  end

  def profile
    @user = User.find(params[:id])
  end
end
