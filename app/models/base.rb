class Base
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :address
  attr_accessible :created_at, :updated_at, :address

end
