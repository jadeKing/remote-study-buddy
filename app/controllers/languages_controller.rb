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
end
