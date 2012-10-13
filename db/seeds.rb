# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RequirementType.create(name: "Functional requirement", short_name: "FR")
RequirementType.create(name: "Non-functional requirement", short_name: "QR")
Section.create(name: "Requirements")
Section.create(name: "Projects")
Section.create(name: "Mobile")
