class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order(:updated_at).last(3)
  end
end
