class RelationsController < ApplicationController
	respond_to :json, :html
  def create
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
      @relation = Relation.create(requirement: @requirement, relation: params[:related_requirement])
    else 
      @requirement = params[:relation][:requirement_id]
      @relation = Relation.create(params[:relation])
    end
  	redirect_to requirement_relations_path(@requirement)
  end

  def index 
    @requirement = Requirement.find(params[:requirement_id])
    gon.requirement_id = @requirement.id
    gon.related = @requirement.related_requirements
    @requirements = Requirement.where("id not in (?)", @requirement.related.collect {|r| r.id}.push(@requirement.id))
    @relations = @requirement.relations
    @relation = Relation.new
    respond_with @requirement.related_requirements
  end

  def destroy
    if params[:requirement_id]
      @requirement = Requirement_id.find(params[requirement_id])
      @relation = @requirement.relations.where(id: params[:id])
    else
      @relation = Relation.find(params[:id])
    end
  	@relation.delete
  	respond_with @relation
  end
end
