class RequirementType < ActiveRecord::Base
  attr_accessible :name, :short_name
  has_many :requirements
end
