class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :title
      t.text :color
      t.text :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
