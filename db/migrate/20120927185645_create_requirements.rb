class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :description
      t.text :rationale
      t.string :originator
      t.text :fit_criterion
      t.text :customer_satisfaction
      t.text :customer_dissatisfaction
      t.string :priority
      t.text :supporting_materials
      t.text :history

      t.timestamps
    end
  end
end
