class FavorVillage < Base
  belongs_to :owner, class_name: "User", inverse_of: "favor_villages"
  belongs_to :village

  attr_accessible :owner, :village

end
