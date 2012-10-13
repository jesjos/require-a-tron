class AddColumnsToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :indentation, :integer
  	add_column :requirements, :section_id, :integer
  end
end
