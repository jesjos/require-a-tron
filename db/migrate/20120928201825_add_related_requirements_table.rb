class AddRelatedRequirementsTable < ActiveRecord::Migration
  def up
  	create_table :related_requirements do |t|
  		t.column :requirement_id, :integer, :null => false
  		t.column :related_requirement_id, :integer, :null => false
  	end
  end

  def down
  	remove_table :related_requirements
  end
end