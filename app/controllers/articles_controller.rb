class ArticlesController < ApplicationController
  # def index
  #   @articles = Article.all
  # end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

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
    if @article
      render 'show'
    else
      redirect_to '/'
    end
  end
  
end
