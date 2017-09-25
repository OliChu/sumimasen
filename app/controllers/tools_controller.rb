class ToolsController < ApplicationController
  def create
    @tool = Tool.find_or_create_by(tool_params)
    authorize @tool
    @tool.save
    @update = false
    @recipe = Recipe.find(recipe_params[:recipe_id])
    unless @recipe.tools.include?(@tool)
      @recipe.tools << @tool
      authorize @recipe
      @recipe.save
      @update = true
    end
    respond_to do |format|
      format.js  # <-- will render `app/views/tools/create.js.erb`
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name)
  end

  def recipe_params
    params.require(:tool).permit(:recipe_id)
  end
end
