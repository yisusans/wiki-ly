class TagsController < ApplicationController

  def create
    @tag = Tag.new(label: params[:label])
    @article = Article.find_by(id: params[:article_id])
    if @tag.save
      @designation = Designation.create(tag_id: @tag.id, article_id: @article.id)
      redirect_to "/groups/#{params[:group_id]}/articles/#{params[:article_id]}"
    else
      @errors = @tags.errors.full_messages
      render 'tags/new/'
    end
  end
end
