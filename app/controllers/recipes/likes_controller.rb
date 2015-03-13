class Recipes::LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_recipe

	def create
 		@like = Like.where(user_id: current_user.id, recipe_id: @recipe.id).first

 		if @like.nil?
 			 @like = Like.where(user_id: current_user.id, recipe_id: @recipe.id).first_or_create
       		 @recipe_was_liked = true
       		 
       		 
 		else
 			@like.destroy
 			@post_was_liked = false
 			#redirect_to @recipe
 			
 		end
 	
	end

	private
	
	def set_recipe
	@recipe = Recipe.find(params[:recipe_id])
	end

end