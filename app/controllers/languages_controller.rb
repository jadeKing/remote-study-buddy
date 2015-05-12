class LanguagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    Language.create(language_params)
    redirect_to '/'
  end

  def language_params
    params.require(:language).permit(:name)
  end

  def show
    @language_users = Language.find(params[:id]).users
    if params[:skill_level]
      @language_users = User.includes(:user_languages).where(user_languages: {language_id: params[:id], skill_level: params[:skill_level]})
    end
  end
end
