# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Empresa.create(:nome => "2upSistemas")
Usuario.create(:empresa_id => "1", :nome => "master@2upsistemas.com.br", :username => "master@2upsistemas.com.br", :password => "master", :password_confirmation => "master", :tipo => "adm")