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
    if new_valid_tag?
      render partial: 'tags/tags'
    else
      flash[:error] = @tag.errors.full_messages
      render :json => {}
    end

  end





  private

  def new_valid_tag?
    if params[:label].present?
      @tag = Tag.find_or_create_by(label: params[:label])
      valid_tag?
    end
  end

  def valid_tag?
    if @tag.valid?
      @designation = Designation.create(tag_id: @tag.id, article_id: @article.id)
    end
  end

end
