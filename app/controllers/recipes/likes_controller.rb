class Recipes::LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_recipe

	def create
 		@like = @recipe.likes.where(user_id: current_user.id).first_or_create!

 		respond_to do |format|
 			format.html { redirect_to @recipe}
 			format.js
 		end
	end

	private
	
	def set_recipe
	@recipe = Recipe.find(params[:recipe_id])
	end

end