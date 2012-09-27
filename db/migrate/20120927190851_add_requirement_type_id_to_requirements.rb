class AddRequirementTypeIdToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :requirement_type_id, :integer
  end
end
