class WelcomeController < ApplicationController
  def index
    @articles = Article.all.where(published: true).order(:updated_at).last(3)
  end
end
