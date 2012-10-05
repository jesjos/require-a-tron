class Conflict < ActiveRecord::Base
  attr_accessible :conflicting_requirement_id, :conflicting_requirement_type, :requirement_id, :requirement_type
end
