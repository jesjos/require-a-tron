class ConflictsController < ApplicationController
	respond_to :json, :html
  def create
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
      related_id = params[:conflict][:conflicting_requirement_id]
      if params[:type] == "requirement"
        @conflicting_requirement = Requirement.find(related_id)
      else
        @conflicting_requirement = PLangRequirement.find(related_id)
      end
      @conflict= Conflict.create(requirement: @requirement, conflicting_requirement: @conflicting_requirement)
    else 
      @requirement = params[:conflict][:requirement_id]
      @conflict= Conflict.create(params[:conflict])
    end
  	redirect_to requirement_conflicts_path(@requirement)
  end

  def index 
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      @requirement = PLangRequirement.find(params[:p_lang_requirement_id])
    end
    @requirements = Requirement.all
    @p_lang_requirements = PLangRequirement.all
    @conflicts = @requirement.conflicts
    @conflict= Conflict.new
    respond_with @requirement.related
  end

  def destroy
    @conflict= Conflict.find(params[:id])
  	@conflict.delete
    if params[:requirement_id]
      redirect_to requirement_conflicts_path(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      redirect_to p_lang_requirements_conflicts_path(params[:p_lang_requirement_id])
    else
      redirect_to root_path
    end
  end
end
