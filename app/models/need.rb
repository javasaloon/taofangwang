class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :budget_min, type: Integer
  field :budget_max, type: Integer
  field :priority, type: Integer

  belongs_to :owner, class_name: 'User'
  has_many :merits, :dependent=> :delete

  attr_accessible :budget_max, :budget_min, :priority, :merits, :owner, :created_at, :updated_at
end
