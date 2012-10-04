class AddFieldsForPolymorphism < ActiveRecord::Migration
  def up
  	change_table :relations do |t|
  		t.string :requirement_type
  		t.string :related_requirement_type
  	end
  end

  def down
  	remove_column :requirement_type
  	remove_column :related_requirement_type
  end
end
