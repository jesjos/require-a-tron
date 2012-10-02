class CreatePLangRequirements < ActiveRecord::Migration
  def change
    create_table :p_lang_requirements do |t|
      t.string :tag
      t.string :gist
      t.string :stakeholder
      t.string :scale
      t.string :meter
      t.string :must
      t.string :plan
      t.string :stretch
      t.string :wish
      t.string :past
      t.string :trend
      t.string :record
      t.string :defined
      t.string :authority

      t.timestamps
    end
  end
end
