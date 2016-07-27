class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(id: params[:id])
    if params[:search]
      search = params[:search].downcase
      capitalize_search = search.capitalize
      @articles = @tag.articles.search(capitalize_search).order("created_at DESC")
    else
      @articles = @tag.articles.order('created_at DESC')
    end
    render '/tags/show'
  end

  def create
    @tag = Tag.new
    @article = Article.find_by(id: params[:article_id])
    @group = @article.group
    @tags = @article.tags
    if @tag.new_valid_tag?(@article, params[:label])
      render partial: 'tags/tags'
    else
      flash[:error] = @tag.errors.full_messages
      render :json => {}
    end

  end

end
