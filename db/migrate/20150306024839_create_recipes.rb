class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :image_id
      t.string :category
      t.text :instructions

      t.timestamps null: false
    end
  end
end
