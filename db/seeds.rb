# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.mongo_session['roles'].insert({ :name => role })
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.create :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

need = Need.create :budget_min=>80, :budget_max=>100, :priority=>1, :owner=>user
p need

merit = Merit.create :name=>"学区房", :priority=>1, :need=>need
merit = Merit.create :name=>"地铁房", :priority=>2, :need=>need
merit = Merit.create :name=>"小一房", :priority=>3, :need=>need
merit = Merit.create :name=>"外环内", :priority=>4, :need=>need
merit = Merit.create :name=>"次新房", :priority=>5, :need=>need
p merit
