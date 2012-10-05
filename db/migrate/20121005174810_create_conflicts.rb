class CreateConflicts < ActiveRecord::Migration
  def change
    create_table :conflicts do |t|
      t.integer :requirement_id
      t.integer :conflicting_requirement_id
      t.string :requirement_type
      t.string :conflicting_requirement_type

      t.timestamps
    end
  end
end
