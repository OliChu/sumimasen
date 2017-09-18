class RecipesController < ApplicationController
  def index
    @recipes = policy_scope(Recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
  params.require(:recipe).permit(:title, :instructions, :photo)
  end

end
