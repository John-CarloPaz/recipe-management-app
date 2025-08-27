class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :ingredients, array: true, default: []
      t.string :instructions, array: true, default: []
      t.string :image_url
      t.string :category
      t.integer :cooking_time
      t.float :servings
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
