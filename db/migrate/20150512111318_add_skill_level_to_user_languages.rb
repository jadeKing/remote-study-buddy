class AddSkillLevelToUserLanguages < ActiveRecord::Migration
  def change
    add_column :user_languages, :skill_level, :string
  end
end
