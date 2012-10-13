class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id, :identification, :conflicting_requirement_ids
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials, :dependency_ids, :related_requirement_ids, :short_name
  attr_accessible :section_id, :indentation, :dependency_id
  validates_presence_of :requirement_type
  acts_as_list scope: :requirement_type

  default_scope order: "position ASC"

  belongs_to :requirement_type

  belongs_to :author, class_name: "User"

  has_many :primary_relations, as: :requirement, class_name: "Relation", dependent: :destroy
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation", dependent: :destroy

  has_many :primary_conflicts, as: :requirement, class_name: "Conflict", dependent: :destroy
  has_many :secondary_conflicts, as: :conflicting_requirement, class_name: "Conflict", dependent: :destroy

  # has_many :dependencies, as: :requirement, class_name: "Dependency"
  belongs_to :dependency, class_name: "Requirement", foreign_key: "dependency_id"
  has_many :dependencies, class_name: "Requirement", foreign_key: "dependency_id"
  
  belongs_to :section

  def children
    dependent_requirements + dependent_p_lang_requirements
  end

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
  	"#{self.identification} - #{self.short_name}"
  end

  def identification
  	"#{self.requirement_type.short_name}#{self.position}"
  end
end
