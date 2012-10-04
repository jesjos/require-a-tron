class AddShortNameToRequirementType < ActiveRecord::Migration
  def change
  	add_column :requirement_types, :short_name, :string
  end
end
