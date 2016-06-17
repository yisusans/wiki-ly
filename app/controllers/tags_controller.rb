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
    if params[:label].length > 0
      @tag = Tag.find_or_create_by(label: params[:label])
      if @tag.valid?
        @designation = Designation.create(tag_id: @tag.id, article_id: @article.id)
      end
    else
      flash[:error] = @tag.errors.full_messages
    end
      redirect_to [@group, @article]
  end

end
