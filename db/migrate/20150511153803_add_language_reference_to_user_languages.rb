class AddLanguageReferenceToUserLanguages < ActiveRecord::Migration
  def change
    add_reference :user_languages, :language, index: true, foreign_key: true
  end
end
