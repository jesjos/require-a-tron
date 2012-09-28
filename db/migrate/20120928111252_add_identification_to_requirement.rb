class AddIdentificationToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :identification, :string
  end
end
