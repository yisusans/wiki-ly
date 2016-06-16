class FavoritesController < ApplicationController

  def create
    @article = Article.find_by(id: params[:article_id])
    @favorite = Favorite.find_or_create_by(user_id: current_user.id, article_id: article.id)
    @user = current_user
    redirect_to @article, notice: 'redirecting after create action'
  end

  def destroy
    @article = Article.find_by(id: params[:article_id])
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    redirect_to @article, notice: 'redirecting after destroy action'
  end

end
