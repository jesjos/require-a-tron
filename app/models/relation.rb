class Relation < ActiveRecord::Base
  attr_accessible :requirement_id, :related_requirement_id, :requirement, :related_requirement

  belongs_to :requirement, polymorphic: true
  belongs_to :related_requirement, polymorphic: true

  def get_related_requirement_for_requirement(requirement)
  	self.requirement == requirement ? self.related_requirement : self.requirement
  end
end
