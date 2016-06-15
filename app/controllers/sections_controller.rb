class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to @section
    else
      @errors = @section.errors.full_messages
      render '/sections/new'
    end
  end

  def edit

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
