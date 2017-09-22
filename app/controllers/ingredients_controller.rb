class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    @ingredient.save
    respond_to do |format|
      format.js  # <-- will render `app/views/ingredients/create.js.erb`
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
