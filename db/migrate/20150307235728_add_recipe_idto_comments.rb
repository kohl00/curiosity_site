class AddRecipeIdtoComments < ActiveRecord::Migration
  def change
  	add_column :comments, :recipe_id, :integer
  end
end
