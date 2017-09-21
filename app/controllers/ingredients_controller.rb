class IngredientsController < ApplicationController
    def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    @ingredient.save
    respond_to do |format|
      format.js  # <-- will render `app/views/ingredients/create.js.erb`
    end
  end

  def edit
    @ingredient = ingredient.find(params[:id])
  end

  def update
    @ingredient = ingredient.update(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @ingredient = ingredient.find(params[:id]) #get the ingredient from the id
    @recipe = Recipe.find(params([:id]))
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
