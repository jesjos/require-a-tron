class AddPolymorphicDependency < ActiveRecord::Migration
  def up
  	add_column :requirements, :dependency_id, :integer
  	add_column :p_lang_requirements, :dependency_id, :integer
  	add_column :requirements, :dependency_type, :string
  	add_column :p_lang_requirements, :dependency_type, :string
  end

  def down
  	remove_column :requirements, :dependency_id
		remove_column :p_lang_requirements, :dependency_id
		remove_column :requirements, :dependency_type
		remove_column :p_lang_requirements, :dependency_type
  end
end
