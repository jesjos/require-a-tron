class AddShortNameToRequirements < ActiveRecord::Migration
  def change
  	add_column :requirements, :short_name, :string
  	add_column :p_lang_requirements, :short_name, :string
  end
end
