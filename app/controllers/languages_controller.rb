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
  end
end
