class ArticlesController < ApplicationController
  include ApplicationHelper

  def new
    @article = Article.new
    @section = Section.new
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id
    @article.sections << @section
  end

  def create
    @article = Article.new(article_params)
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id

    if @article.save
      render '/articles/show'
    else
      @errors = @article.errors.full_messages
      redirect_to @group
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    @group = Group.find_by(id: params[:group_id])
    if @article
      render '/articles/show'
    else
      redirect_to @group
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @article.update(product_params)
  end

  # def destroy
  #   @article = Article.find_by(id: params[:id])
  #   @article.delete
  #   redirect_to root_path
  # end

  private
    def article_params
      params.require(:article).permit(:title, :bibliography, section_attributes: [:subtitle, :body])
    end

end
