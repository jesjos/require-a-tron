class Conflict < ActiveRecord::Base
  attr_accessible :conflicting_requirement_id, :conflicting_requirement_type, :requirement_id, :requirement_type, :requirement, :conflicting_requirement
  belongs_to :requirement, polymorphic: true
  belongs_to :conflicting_requirement, polymorphic: true

  def get_conflicting_requirement_for_requirement(requirement)
  	self.requirement == requirement ? self.conflicting_requirement : self.requirement
  end
end
