class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe, index: true
      t.text :step

      t.timestamps
    end
  end
end
