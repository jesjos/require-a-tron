module RequirementsHelper
	def sanitize_string(string)
		string.gsub("%", "\\%")
	end
end
