class SectionsController < ApplicationController
	respond_to :json, :text, :html
  def show
  	@section = Section.find(params[:id])
  	@requirements = @section.requirements
  	respond_with(@section)
  end

  def index
  	@sections = Section.all
  	respond_with(@sections)
  end
end
