class AddIdentificationToPLangRequirement < ActiveRecord::Migration
  def change
  	add_column :p_lang_requirements, :identification, :string
  end
end
