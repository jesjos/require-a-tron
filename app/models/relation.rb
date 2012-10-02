class Relation < ActiveRecord::Base
  attr_accessible :requirement_id, :related_requirement_id

  def get_related_requirement_for_id(id)
  	id = self.requirement_id == id ? self.related_requirement_id : self.requirement_id
  	Requirement.find(id)
  end
end
