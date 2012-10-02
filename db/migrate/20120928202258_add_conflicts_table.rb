class AddConflictsTable < ActiveRecord::Migration
  def up
  	create_table :conflicting_requirements do |t|
  		t.column :requirement_id, :integer, null: false
  		t.column :conflicting_requirement_id, :integer, null: false
  	end
  end

  def down
  	remove_table :conflicting_requirements
  end


end
