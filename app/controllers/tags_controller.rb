class TagsController < ApplicationController

  def create
    @tag = Tag.find_or_create_by(label: params[:label])
    @article = Article.find_by(id: params[:article_id])
    if @tag.valid?
      @designation = Designation.create(tag_id: @tag.id, article_id: @article.id)
      redirect_to group_article_path(@article.group, @article)
    else
      @errors = @tags.errors.full_messages
      render 'tags/new/'
    end
  end


  # def show
  #   @articles = Article.where(tag_id: params[:id])
  # end


end
