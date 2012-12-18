class Merit
  include Mongoid::Document
  rolify
  include Mongoid::Timestamps

  field :name, type: String
  field :priority, type: Integer

  belongs_to :need

  attr_accessor :name, :priority, :need, :created_at, :updated_at

end
