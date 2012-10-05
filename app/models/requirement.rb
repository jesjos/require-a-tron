class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id, :identification, :conflicting_requirement_ids
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials, :dependency_ids, :related_requirement_ids
  validates_presence_of :requirement_type
  acts_as_list scope: :requirement_type

  belongs_to :requirement_type
  has_and_belongs_to_many :dependencies, class_name: "Requirement", association_foreign_key: :dependent_id, join_table: "dependencies"

  belongs_to :author, class_name: "User"

  has_many :primary_relations, as: :requirement, class_name: "Relation"
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation"

  has_many :primary_conflicts, as: :requirement, class_name: "Conflict"
  has_many :secondary_conflicts, as: :conflicting_requirement, class_name: "Conflict"

  has_many :dependencies, as: :requirement, class_name: "Dependency"

  def relations
  	self.primary_relations + self.secondary_relations
  end

  def related
  	self.relations.collect {|r| r.requirement == self ? r.related_requirement : r.requirement}
  end

   def conflicts
  	self.primary_conflicts + self.secondary_conflicts
  end

  def conflicting_requirements
  	self.conflicts.collect {|r| r.requirement == self ? r.conflicting_requirement : r.requirement}
  end

  def pretty_name
  	"#{self.identification} - #{self.description}"
  end

  def identification
  	"#{self.requirement_type.short_name}#{self.position}"
  end
end
