class PrimarySchool < Service
  field :level, type: String
  field :feature, type: String

  has_and_belongs_to_many :middle_schools
  belongs_to :district
  attr_accessible :level, :feature, :district, :middle_schools
end
