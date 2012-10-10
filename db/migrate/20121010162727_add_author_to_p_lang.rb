class AddAuthorToPLang < ActiveRecord::Migration
  def change
  	add_column :p_lang_requirements, :author_id, :integer
  end
end
