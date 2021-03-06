class FavoritesController < ApplicationController

  def create
    @article = Article.find_by(id: params[:article_id])
    @group = @article.group
    @favorite = Favorite.find_or_create_by(user_id: current_user.id, article_id: @article.id)
    @user = current_user
    redirect_to [@group, @article]
  end

  def destroy
    @article = Article.find_by(id: params[:article_id])
    @group = @article.group
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    @favorite.destroy
    redirect_to [@group, @article]
  end

end
