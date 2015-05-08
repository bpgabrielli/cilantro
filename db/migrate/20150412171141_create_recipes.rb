class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :link
      t.text :title
      t.text :subhead
      t.text :intro
      t.text :ingredients
      t.text :steps
      t.text :notes
      t.text :image
      t.boolean :star, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
