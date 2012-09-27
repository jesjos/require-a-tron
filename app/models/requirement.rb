class Requirement < ActiveRecord::Base
  attr_accessible :customer_dissatisfaction, :customer_satisfaction, :description, :fit_criterion, :history, :originator, :priority, :rationale, :supporting_materials
end
