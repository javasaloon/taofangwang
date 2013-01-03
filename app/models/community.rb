class Community < Base
  field :name, type: String
  field :basic, type: String
  field :function, type: String

  field :basic, type: String
  field :basic, type: String
  field :basic, type: String
  field :basic, type: String
  field :basic, type: String


  has_many :parks
  has_many :suppermarkets
  has_many :stations
  has_many :gardens
  has_many :hospitals
  has_many :primary_schools
  has_many :middle_schools
  has_many :colleges

  has_many :villages
  belongs_to :district

  embeds_one :planning
  attr_accessible :name, :planning, :district, :villages

  def countOf(serviceName)
    method(serviceName).call().length
  end

end
