class Language < ActiveRecord::Base
  has_many :users, through: :user_languages
  has_many :user_languages
  
end
