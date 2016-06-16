class FavoritesController < ApplicationController

  def create
    article = Article.find_by(id: params[:favorite][:article_id])
    favorite = Favorite.find_or_create_by(user: current_user, article: article)
  end

  def destroy
    favorite = Favorite.find_by(user: current_user, article_id: params[:favorite][:article_id])
    article = Article.find_by(id: params[:favorite][:article_id])
  end

end
