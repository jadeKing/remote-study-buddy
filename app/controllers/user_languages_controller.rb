class UserLanguagesController < ApplicationController
  def new
  end

  def create
    @user_language = UserLanguage.first_or_create(language_id: params[:language_id], user_id: current_user.id)
    redirect_to '/'
  end
end
