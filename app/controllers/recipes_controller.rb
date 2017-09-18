class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
  params.require(:recipe).permit(:title, :instructions, :photo)
  end
  
end
