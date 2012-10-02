class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :requirement_id
      t.integer :related_requirement_id

      t.timestamps
    end
  end
end
