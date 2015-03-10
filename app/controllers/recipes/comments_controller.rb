class Recipes::CommentsController < ApplicationController
	before_action :set_recipe
    before_action :authenticate_user!

	def create
		@comment = @recipe.comments.new comment_params
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @recipe
		else
			redirect_to @recipe, alert: "Unable to save"
		end
	end

	def new
		@comment = Comment.new
	end


	private

	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end

end