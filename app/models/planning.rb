class Planning < Base
  field :overall, type: String
  field :residence, type: String
  field :business, type: String
  field :industry, type: String
  field :traffic, type: String
  field :health, type: String
  field :education, type: String
  field :entertainment, type: String

  embeds_one :swot

  attr_accessible :overall, :residence, :business, :industry, :traffic,
    :health, :education, :entertainment, :swot

end
