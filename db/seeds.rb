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

def roles
  puts 'ROLES'
  YAML.load(ENV['ROLES']).each do |role|
    Role.mongo_session['roles'].insert({ :name => role })
    puts 'role: ' << role
  end
end

def users
  puts 'DEFAULT USERS'
  user = User.create :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
  puts 'user: ' << user.name
  user.add_role :admin
  user
end

def needs ()
  user = User.first
  need = Need.create :budget_min=>80, :budget_max=>100, :priority=>1, :owner=>user

  merit = Merit.create :name=>"学区房", :priority=>1, :need=>need
  merit = Merit.create :name=>"地铁房", :priority=>2, :need=>need
  merit = Merit.create :name=>"小一房", :priority=>3, :need=>need
  merit = Merit.create :name=>"外环内", :priority=>4, :need=>need
  merit = Merit.create :name=>"次新房", :priority=>5, :need=>need
  p merit

end

def cities(data_dir, city)
  p "seeding districts ... in #{city.name} "
  lines = File.open("#{data_dir}/districts.txt", "r").read
  lines.each_line do |line|
    words = line.split
    d = District.create!(name: words[0], city: city)
    words[1..words.length].each do |community|
      Community.create!(name: community, district: d)
    end
  end
end

def seed_service(txt, service)
  p "seeding #{service} using #{txt} ... "
  lines = File.open("#{txt}.txt", "r").readlines("\\n")
  lines.each do |line|
    words = line.chomp("\\n").split(";")
    #p words
    next if words.empty?
    words = words.collect {|item| item.strip}
    coordinators = words[-1][1..-2].split(",")
    point = Point.create(lng: coordinators[0], lat: coordinators[1])
    comm = Community.where(name: /.*#{words[0]}.*/).first
    p "not found #{words[0]}" if comm == nil
    addr = Address.create(name: words[2], point: point)
    phone = words[3] || ""
    service.create(name: words[1], address: addr, phone: phone, community: comm)
  end
end

def seed_services(data_dir, city)
  serviceMap = [
    #{:txt => :parks_sh, :clazz => Park},
    #{:txt => :gardens_sh, :clazz => Garden},
    #{:txt => :primary_schools_sh, :clazz => PrimarySchool},
    #{:txt => :middle_schools_sh, :clazz => MiddleSchool},
    #{:txt => :high_schools_sh, :clazz => HighSchool},
    #{:txt => :colleges_sh, :clazz => College},
    #{:txt => :suppermarkets_sh, :clazz => Suppermarket},
    #{:txt => :stations_sh, :clazz => Station},
    #{:txt => :hospitals_sh, :clazz => Hospital},
    {:txt => :villages_sh, :clazz => Village}
  ]

  serviceMap.each do |service|
    seed_service("#{data_dir}/#{service[:txt]}", service[:clazz])
  end
end

def favors
  user = User.first
  names = %w(同济新村 东方城市花园二期 公园3000·黄兴花园 上海大花园)
  names.each do |v|
    p FavorVillage.create owner: user, village: Village.where(name:v).first
  end
end

def plannings(data_dir)

end

def seed(data_dir, city)
  roles
  users
  needs
  cities(data_dir, city)
  seed_services(data_dir, city)

  favors
end

data_dir = "/Users/chengxiang/workspace/assets"
sh = City.where(name: "上海").first || City.create!(name: "上海")
seed(data_dir, sh)
