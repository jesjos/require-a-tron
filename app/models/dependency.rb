class Dependency < ActiveRecord::Base
  attr_accessible :dependent_requirement_id, :dependent_requirement_type, :requirement_id, :requirement_type, :requirement, :dependent_requirement

  # belongs_to :requirement, polymorphic: true
  # belongs_to :dependent_requirement, polymorphic: true

  def get_dependent_requirement_for_requirement(requirement)
  	self.requirement == requirement ? self.dependent_requirement : self.requirement
  end
end
