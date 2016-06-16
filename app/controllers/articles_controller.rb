class ArticlesController < ApplicationController
include ApplicationHelper

  def index
    @articles = Article.all
    if params[:search]
      @articles = Article.search(params[:search]).order("created_at DESC")
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def new
    redirect_to_login
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.writer_id = current_user.id
    @article.group_id = #this needs to be filled in
    if @article.save
      @article.state = "unpublished"
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    @user = @article.writer.username
    if @article
      render 'show'
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :bibliography)
    end

    def section_params
      params.require(:section).permit(:subtitle, :body)
    end

end
