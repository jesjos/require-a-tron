class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials, :dependency_ids
  validates_presence_of :requirement_type


  belongs_to :requirement_type
  has_and_belongs_to_many :dependencies, class_name: "Requirement", association_foreign_key: :dependent_id, join_table: "dependencies"

end
