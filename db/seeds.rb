#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

users = User.create([{:email => 'gunsmoke.shin@gmail.com', :username => 'administrator', :password => 'admin', :password_confirmation => 'admin', :role => 'admin'}])

categories = Category.create([{:number => 1, :name => '공지사항'}, {:number => 2, :name => 'FAQ'}, {:number => 3, :name => '질문답변'}, {:number => 4, :name => '기타'}])

