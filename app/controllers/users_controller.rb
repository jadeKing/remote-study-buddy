class UsersController < ApplicationController
  def show
    @profile_user = User.find(params[:id])
  end
end
