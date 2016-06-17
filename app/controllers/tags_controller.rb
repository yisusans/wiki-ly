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

end
