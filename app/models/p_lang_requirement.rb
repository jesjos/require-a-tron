class PLangRequirement < ActiveRecord::Base
  attr_accessible :authority, :defined, :gist, :meter, :must, :past, :plan, :record, :scale, :stakeholder, :stretch, :tag, :trend, :wish
  acts_as_list
  
  has_many :primary_relations, as: :requirement, class_name: "Relation"
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation"

  has_many :primary_relations, as: :requirement, class_name: "Relation"
  has_many :secondary_relations, as: :related_requirement, class_name: "Relation"

  def relations
  	self.primary_relations + self.secondary_relations
  end

  def related
  	self.relations.collect {|r| r.requirement == self ? r.related_requirement : r.requirement}
  end

  def pretty_name
  	"#{self.identification} - #{tag}"
  end

  def identification
  	"PLang#{position}"
  end
end
