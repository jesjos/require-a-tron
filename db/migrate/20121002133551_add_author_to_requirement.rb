class AddAuthorToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :author_id, :integer
  end
end
