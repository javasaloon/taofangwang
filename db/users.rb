module Users
  module ClassMethods
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
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
