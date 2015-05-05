class RecipesController < ApplicationController
  
before_action :authenticate_user!, only: [:create, :update, :destroy, :index]
before_action :set_recipe, except: [:index, :new, :create]
  def new
    @title = "Submit a Recipe"
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	if @recipe.save
      @recipe.send_notification_email
  		redirect_to @recipe, success: "Successful"

  	else
      render 'new'
    end
  end

  def edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = @recipe.comments.build
    @clean_recipe = Sanitizer.new(@recipe)
    @recipe_comments = Recipe.includes(:comments).where(id: params[:id])[0].comments
    @like = @recipe.likes.new
  
  end

  def update
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

  def index
      @q = Recipe.search(params[:q])
      @recipes = @q.result.includes(:tags)
  end

  def tag
    @recipes = Recipe.tagged_with(params[:tag]) 
    if @recipes != false
      render 'index'
    else
      redirect_to root_path
    end
  end

  private

   def set_recipe
   	@recipe = Recipe.find(params[:id])
   end

   def recipe_params
  	 params.require(:recipe).permit(:name, :image_id, :category, :instructions, :tag_list, :image)
   end
end
