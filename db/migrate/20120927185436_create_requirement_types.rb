class CreateRequirementTypes < ActiveRecord::Migration
  def change
    create_table :requirement_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
