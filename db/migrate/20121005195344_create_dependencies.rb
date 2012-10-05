class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :requirement_id
      t.integer :dependent_requirement_id
      t.string :requirement_type
      t.string :dependent_requirement_type

      t.timestamps
    end
  end
end
