class AddPositionToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :position, :integer

  	Requirement.all.each_with_index do |r, i|
  		r.position = i+1
  		r.save!
  	end
  end
end
