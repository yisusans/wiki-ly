class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
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
    @article = Article.find_by(id: params[:id])
    @article.update(product_params)
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.delete
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :bibliography, section_attributes: [:subtitle, :body])
    end

    # def section_params
    #   params.require(:section).permit(:subtitle, :body)
    # end

end
