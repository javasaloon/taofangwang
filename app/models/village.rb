class Village < Base
  include Mongoid::Document
  field :name, type: String
  #has_many :apartment
  belongs_to :community
  attr_accessible :name, :community
end
