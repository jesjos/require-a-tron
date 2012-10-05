class DependenciesController < ApplicationController
	respond_to :json, :html
  def create
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
    else 
    	@requirement = PLangRequirement.find(params[:p_lang_requirement_id])
    end
		dependent_id = params[:dependency][:dependent_requirement_id]
    if params[:type] == "requirement"
      @dependent_requirement = Requirement.find(dependent_id)
    else
      @dependent_requirement = PLangRequirement.find(dependent_id)
    end
     @dependency= Dependency.create(requirement: @requirement, dependent_requirement: @dependent_requirement)
  	redirect_to params[:requirement_id] ? requirement_dependencies_path(@requirement) : p_lang_requirement_dependencies_path(@requirement)
  end

  def index 
    if params[:requirement_id]
      @requirement = Requirement.find(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      @requirement = PLangRequirement.find(params[:p_lang_requirement_id])
    end
    @requirements = Requirement.all
    @p_lang_requirements = PLangRequirement.all
    @dependencies = @requirement.dependencies
    @dependency = Dependency.new
    respond_with @requirement.dependencies
  end

  def destroy
    @dependency= Dependency.find(params[:id])
  	@dependency.delete
    if params[:requirement_id]
      redirect_to requirement_dependencies_path(params[:requirement_id])
    elsif params[:p_lang_requirement_id]
      redirect_to p_lang_requirement_dependencies_path(params[:p_lang_requirement_id])
    else
      redirect_to root_path
    end
  end
end
