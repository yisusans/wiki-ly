class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    @article = Article.find_by(id: params[:id])
    if @tag.save
      @designation = Designation.create(tag_id: @tag.id, article_id: @article.id)
      redirect_to @article
    else
      @errors = @tags.errors.full_messages
      render 'tags/new/'
    end

  end


private
  def tag_params
    params.require(:tag).permit(:label)
  end

end
