# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create!(name: 'Ruby')
Language.create!(name: 'Python')
Language.create!(name: 'JavaScript')
Language.create!(name: 'Java')

User.create!(username: 'Vlady', email: 'vlady@home.less', password: 'dododone')
User.create!(username: 'banker', email: 'banking@home.less', password: 'dododone')
User.create!(username: 'split', email: 'split@home.less', password: 'dododone')
User.create!(username: 'faintest', email: 'faintest@home.less', password: 'dododone')
