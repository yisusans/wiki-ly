class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @article = Article.find_by(id: params[:article_id])
    @section = Section.new(section_params)
    if @section.save
      puts "*" * 25
      puts "I've been saved"
      puts "*" * 25
      redirect_to [@article.group, @article]
    else
      puts "*" * 25
      puts "I have not been saved"
      puts "*" * 25
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
