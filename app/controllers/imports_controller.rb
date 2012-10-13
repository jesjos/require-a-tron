class ImportsController < ApplicationController
  def new
  end

  def import
  	debugger
  	begin 
  		file = params[:csv_file]
  		r = Importers::RequirementImporter.import(file.tempfile)
  		redirect_to root_path, notice: "Successfully imported #{r.count} requirements"
  	rescue Exception => e
  		redirect_to imports_new_path, notice: "Something went wrong: #{e}"
  	end
  end
end
