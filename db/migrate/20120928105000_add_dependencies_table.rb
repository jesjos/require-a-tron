class AddDependenciesTable < ActiveRecord::Migration
  def up
  	create_table :dependencies do |t|
  		t.column :requirement_id, :integer, :null => false
  		t.column :dependent_id, :integer, :null => false
  	end
  end

  def down
  	remove_table :dependencies
  end
end
