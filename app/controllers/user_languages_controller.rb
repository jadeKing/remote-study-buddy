class UserLanguagesController < ApplicationController
  def new
  end

  def create
    @user_language = UserLanguage.where(language_id: params[:language_id], user_id: current_user.id)

    unless @user_language.first
      UserLanguage.create(language_id: params[:language_id], user_id: current_user.id, skill_level: params[:skill_level])
    end
    redirect_to '/'
  end
end
