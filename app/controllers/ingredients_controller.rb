class IngredientsController < ApplicationController
   before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    @ingredient.save
    respond_to do |format|
      format.html {redirect_to(root_path)}
      format.js  # <-- will render `app/views/ingredients/create.js.erb`
    end
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def edit

  end

   def index
    @ingredients = policy_scope(Ingredient)
    @ingredients = Ingredient.all
    authorize @ingredients
  end

  def show

  end

  def update
    @ingredient.update(ingredient_params)
    if ingredient.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

   def set_ingredient
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
