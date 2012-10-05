class AddPositionToPLangRequirement < ActiveRecord::Migration
  def change
  	add_column :p_lang_requirements, :position, :integer

  	PLangRequirement.all.each_with_index do |r, i|
  		r.position = i+1
  		r.save!
  	end
  end
end
