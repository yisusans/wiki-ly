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
    @user = @article.writer.username
    # @favorite = @article.favorites.find_by(user_id: current_user.id, article_id: params[:favorite][:article_id])
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
