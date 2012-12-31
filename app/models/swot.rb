class Swot
  include Mongoid::Document
  field :overall, type: String
  field :strength, type: String
  field :weakness, type: String
  field :opportunity, type: String
  field :threat, type: String

  enbedded_in :planning

  attr_accessible :overall, :strength, :weakness, :threat
end
