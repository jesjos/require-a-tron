class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id, :identification, :conflicting_requirement_ids
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials, :dependency_ids, :related_requirement_ids
  validates_presence_of :requirement_type

  belongs_to :requirement_type
  has_and_belongs_to_many :dependencies, class_name: "Requirement", association_foreign_key: :dependent_id, join_table: "dependencies"
  has_and_belongs_to_many :related_requirements, class_name: "Requirement", association_foreign_key: :related_requirement_id, join_table: "related_requirements"
  has_and_belongs_to_many :conflicting_requirements, class_name: "Requirement", association_foreign_key: :conflicting_requirement_id, join_table: "conflicting_requirements"
  belongs_to :author, class_name: "User"
  
  def relations
  	Relation.where("requirement_id = ? OR related_requirement_id = ?", self.id, self.id)
  end

  def related
  	Requirement.find(self.relations.collect {|r| r.get_related_requirement_for_id(self.id).id})
  end
end
