class RelationsController < ApplicationController
	respond_to :json, :html
  def create
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
      related_id = params[:relation][:related_requirement_id]
      if params[:type] == "requirement"
        @related_requirement = Requirement.find(related_id)
      else
        @related_requirement = PLangRequirement.find(related_id)
      end
      @relation = Relation.create(requirement: @requirement, related_requirement: @related_requirement)
    else 
      @requirement = params[:relation][:requirement_id]
      @relation = Relation.create(params[:relation])
    end
  	redirect_to requirement_relations_path(@requirement)
  end

  def index 
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      @requirement = PLangRequirement.find(params[:p_lang_requirement_id])
    end
    @requirements = Requirement.all
    @p_lang_requirements = PLangRequirement.all
    @relations = @requirement.relations
    @relation = Relation.new
    respond_with @requirement.related
  end

  def destroy
    @relation = Relation.find(params[:id])
  	@relation.delete
    if params[:requirement_id]
      redirect_to requirement_relations_path(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      redirect_to p_lang_requirements_relations_path(params[:p_lang_requirement_id])
    else
      redirect_to root_path
    end
  end
end
