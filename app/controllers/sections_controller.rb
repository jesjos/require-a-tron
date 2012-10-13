class SectionsController < ApplicationController
  def show
  	@section = Section.find(params[:id])
  end

  def index
  	@sections = Section.all
  end
end
