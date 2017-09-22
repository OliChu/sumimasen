class TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)
    authorize @tag
    @tag.save
    respond_to do |format|
      format.js  # <-- will render `app/views/tags/create.js.erb`
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
