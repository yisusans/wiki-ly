class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @article = Article.find_by(id: params[:id])
    @section = @article.sections.new(section_params)
    if @section.save
      redirect_to @article
    else
      @errors = @section.errors.full_messages
      render "/articles/#{@article.id}"
    end
  end

  def edit
    @section = Section.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @section = Section.find_by(id: params[:id])
    @section.delete
    redirect_to root_path
  end

private
  def section_params
    params.require(:section).permit(:subtitle, :body, :article_id)
  end

end
