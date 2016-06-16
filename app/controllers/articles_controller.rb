class ArticlesController < ApplicationController
  # def index
  #   @articles = Article.all
  # end

  def new
    @article = Article.new
  end

  def create
    binding.pry
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
    @tag = Tag.new
    @article = Article.find_by(id: params[:id])
    @tags = @article.tags
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
