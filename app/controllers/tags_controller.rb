class TagsController < ApplicationController
  def create
    @tag = Tag.find_or_create_by(tag_params)
    authorize @tag
    @tag.save
    @update = false
    @recipe = Recipe.find(recipe_params[:recipe_id])
    unless @recipe.tags.include?(@tag)
      @recipe.tags << @tag
      authorize @recipe
      @recipe.save
      @update = true
    end
    respond_to do |format|
      format.js  # <-- will render `app/views/tags/create.js.erb`
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def recipe_params
    params.require(:tag).permit(:recipe_id)
  end
end
