class ArticlesController < ApplicationController

include ApplicationHelper

  def index
    @articles = Article.all
    if params[:search]
      search = params[:search].downcase
      capitalize_search = search.capitalize
      @articles = Article.search(capitalize_search).order("created_at DESC")
   else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def new
    @article = Article.new
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id
  end

  def create
    @article = Article.new(article_params)
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id
    if @article.save
       render '/articles/show'
    else
      flash[:errors] = @article.errors.full_messages
      redirect_to @group
    end
  end

  def show
    @tag = Tag.new
    @article = Article.find_by(id: params[:id])
    @tags = @article.tags
    @user = @article.writer.username
    @group = Group.find_by(id: params[:group_id])

    if @article
      render '/articles/show'
    else
      redirect_to @group
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @group = @article.group
  end

  def update
    @article = Article.find(params[:id])
    @group = @article.group

    if @article.update(article_params)
      redirect_to [@group, @article]
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to @article.group
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
