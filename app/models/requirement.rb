class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id, :identification, :conflicting_requirement_ids
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials, :dependency_ids, :related_requirement_ids
  validates_presence_of :requirement_type
  acts_as_list

  belongs_to :requirement_type
  has_and_belongs_to_many :dependencies, class_name: "Requirement", association_foreign_key: :dependent_id, join_table: "dependencies"
  has_and_belongs_to_many :related_requirements, class_name: "Requirement", association_foreign_key: :related_requirement_id, join_table: "related_requirements"
  has_and_belongs_to_many :conflicting_requirements, class_name: "Requirement", association_foreign_key: :conflicting_requirement_id, join_table: "conflicting_requirements"
  belongs_to :author, class_name: "User"

  has_many :primary_relations, as: :requirement, class_name: "Relation"
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation"

  def relations
  	self.primary_relations + self.secondary_relations
  end

  def related
  	self.relations.collect {|r| r.requirement == self ? r.related_requirement : r.requirement}
  end

  def pretty_name
  	if self.identification
  		"#{self.identification} - #{self.description}"
  	else
  		"#{self.description}"
  	end
  end

  def iden
  	"#{self.requirement_type.short_name}#{number}"
  end
end
