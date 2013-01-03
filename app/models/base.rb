class Base
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :created_at, :updated_at
end
