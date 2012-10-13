class RequirementImporter
	def self.import(path)
		requirements = CsvMapper::import(path) do
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
	end
end