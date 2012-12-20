# encoding: utf-8
class Merit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :priority, type: Integer

  belongs_to :need

  attr_accessible :name, :priority, :need, :created_at, :updated_at

end
