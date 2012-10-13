class RequirementsController < ApplicationController
  before_filter :fetchRequirementsAndTypes, only: [:new, :edit]
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  def edit_relations
    @requirement = Requirement.find(params[:id])
    gon.related = @requirement.related_requirements

    respond_to do |format|
      format.html
    end
  end

  # GET /requirements/new
  # GET /requirements/new.json
  def new
    @requirement = Requirement.new
    @requirement_types = RequirementType.all.collect {|t| [t.name, t.id]}
    @requirements = Requirement.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find(params[:id])
    @requirements = Requirement.all.collect {|r| [r.pretty_name, r.id]}
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(params[:requirement])
    @requirement.author = current_user

    respond_to do |format|
      if @requirement.save
        if params[:requirement][:related_requirement_ids]
          params[:requirement][:related_requirement_ids].each do |id|
            Relation.create(requirement: @requirement, related_requirement_id: @iji)
          end
        end
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement, status: :created, location: @requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.json
  def update
    @requirement = Requirement.find(params[:id])
    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to requirements_url }
      format.json { head :no_content }
    end
  end

  private 
  def fetchRequirementsAndTypes
    @requirement_types = RequirementType.all.collect {|t| [t.name, t.id]}
    @requirements = Requirement.where("id != ?", params[:id])
  end

end
