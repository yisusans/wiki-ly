class WelcomeController < ApplicationController
  def index
    @articles = Article.all.limit(3)
  end
end
