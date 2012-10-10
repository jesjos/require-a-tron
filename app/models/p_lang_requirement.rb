class PLangRequirement < ActiveRecord::Base
  attr_accessible :authority, :defined, :gist, :meter, :must, :past, :plan, :record, :scale, :stakeholder, :stretch, :tag, :trend, :wish
  acts_as_list

  default_scope order: "position ASC"

  has_many :primary_relations, as: :requirement, class_name: "Relation", dependent: :destroy
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation", dependent: :destroy

  has_many :primary_conflicts, as: :requirement, class_name: "Conflict", dependent: :destroy
  has_many :secondary_conflicts, as: :conflicting_requirement, class_name: "Conflict", dependent: :destroy

	# has_many :dependencies, as: :requirement, class_name: "Dependency"
  belongs_to :dependency, polymorphic: true
  has_many :dependent_requirements, as: :dependency, class_name: "Requirement"
  has_many :dependent_p_lang_requirements, as: :dependency, class_name: "PLangRequirement"

  belongs_to :author, class_name: "User", foreign_key: "author_id"

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
  	"#{self.identification} - #{tag}"
  end

  def identification
  	"PLang#{position}"
  end
end
