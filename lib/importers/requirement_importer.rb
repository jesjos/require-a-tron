module Importers
	class RequirementImporter
		def self.import(file)
			requirements = CsvMapper::import(file, type: :io) do
				map_to Requirement
				read_attributes_from_file
			end
			type = RequirementType.where(short_name: "FR").first
			Requirement.transaction do 
				requirements.each do |r|
					r.requirement_type = type
					r.save!
				end
			end
			return requirements
		end
	end
end