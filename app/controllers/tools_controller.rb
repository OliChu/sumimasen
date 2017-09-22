class ToolsController < ApplicationController
  def create
    @tool = Tool.new(tool_params)
    authorize @tool
    @tool.save
    respond_to do |format|
      format.js  # <-- will render `app/views/tools/create.js.erb`
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name)
  end
end
