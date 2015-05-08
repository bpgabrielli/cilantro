class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true
      t.text :ingredient

      t.timestamps
    end
  end
end
