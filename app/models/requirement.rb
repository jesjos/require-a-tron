class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :requirement_type_id
  attr_accessible :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials

  belongs_to :requirement_type
  has_many :dependencies
  has_many :requirements, through: :dependencies
end
