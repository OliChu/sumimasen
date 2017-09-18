class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = policy_scope(Recipe)
    @recipes = Recipe.all
    authorize @recipes
  end

  def show
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new
    end
  end

  def edit
    authorize @recipe
  end

  def update
    @recipe = Recipe.update(recipe_params)
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new
    end
  end

  def delete
    authorize @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
  params.require(:recipe).permit(:title, :instructions, photos: [])
  end

end
