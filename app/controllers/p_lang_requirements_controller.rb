class PLangRequirementsController < ApplicationController
  # GET /p_lang_requirements
  # GET /p_lang_requirements.json
  def index
    @p_lang_requirements = PLangRequirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @p_lang_requirements }
    end
  end

  # GET /p_lang_requirements/1
  # GET /p_lang_requirements/1.json
  def show
    @p_lang_requirement = PLangRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @p_lang_requirement }
    end
  end

  # GET /p_lang_requirements/new
  # GET /p_lang_requirements/new.json
  def new
    @p_lang_requirement = PLangRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @p_lang_requirement }
    end
  end

  # GET /p_lang_requirements/1/edit
  def edit
    @p_lang_requirement = PLangRequirement.find(params[:id])
  end

  # POST /p_lang_requirements
  # POST /p_lang_requirements.json
  def create
    @p_lang_requirement = PLangRequirement.new(params[:p_lang_requirement])
    @p_lang_requirement.author = current_user

    respond_to do |format|
      if @p_lang_requirement.save
        format.html { redirect_to @p_lang_requirement, notice: 'P lang requirement was successfully created.' }
        format.json { render json: @p_lang_requirement, status: :created, location: @p_lang_requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @p_lang_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /p_lang_requirements/1
  # PUT /p_lang_requirements/1.json
  def update
    @p_lang_requirement = PLangRequirement.find(params[:id])

    respond_to do |format|
      if @p_lang_requirement.update_attributes(params[:p_lang_requirement])
        format.html { redirect_to @p_lang_requirement, notice: 'P lang requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @p_lang_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /p_lang_requirements/1
  # DELETE /p_lang_requirements/1.json
  def destroy
    @p_lang_requirement = PLangRequirement.find(params[:id])
    @p_lang_requirement.destroy

    respond_to do |format|
      format.html { redirect_to p_lang_requirements_url }
      format.json { head :no_content }
    end
  end
end
