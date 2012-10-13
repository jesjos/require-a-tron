class Import < ActiveRecord::Base
	def import(file)
		Importers::RequirementImporter.import(file)
	end
end
