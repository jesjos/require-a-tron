class ChangeTypesInPLangRequirements < ActiveRecord::Migration
  def up
			change_column :p_lang_requirements, :tag, :text
      change_column :p_lang_requirements, :gist, :text
      change_column :p_lang_requirements, :stakeholder, :text
      change_column :p_lang_requirements, :scale, :text
      change_column :p_lang_requirements, :meter, :text
      change_column :p_lang_requirements, :must, :text
      change_column :p_lang_requirements, :plan, :text
      change_column :p_lang_requirements, :stretch, :text
      change_column :p_lang_requirements, :wish, :text
      change_column :p_lang_requirements, :past, :text
      change_column :p_lang_requirements, :trend, :text
      change_column :p_lang_requirements, :record, :text
      change_column :p_lang_requirements, :defined, :text
      change_column :p_lang_requirements, :authority, :text
  end

  def down
  end
end
